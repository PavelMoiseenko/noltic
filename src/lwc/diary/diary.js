import {LightningElement, api, wire} from 'lwc';
import {deleteRecord} from 'lightning/uiRecordApi';
import getRelatedDiariesByContactId from '@salesforce/apex/DiaryController.getRelatedDiariesByContactId';
import addDiary from '@salesforce/apex/DiaryController.addDiary';
import {ShowToastEvent} from "lightning/platformShowToastEvent";
import {refreshApex} from "@salesforce/apex";

export default class Diary extends LightningElement {
    @api recordId;

    @wire(getRelatedDiariesByContactId, {contactId: '$recordId'})
    diaries;

    handleNoteChange(event) {
        this.note = event.target.value;
    }

    createDiary() {
        addDiary({contactId: this.recordId, note: this.note})
            .then(() => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: "Success",
                        message: 'Diary was created',
                        variant: "success"
                    })
                );
                return refreshApex(this.diaries);
            })
            .catch(error => console.log(error));
    }

    deleteDiary(event) {
        const diaryId = event.target.dataset.diaryid;
        deleteRecord(diaryId)
            .then(() => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Diary was deleted',
                        variant: 'success'
                    })
                );
                return refreshApex(this.diaries);
            })
            .catch(error => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error deleting diary',
                        message: error.body.message,
                        variant: 'error'
                    })
                );
            });
    }


}