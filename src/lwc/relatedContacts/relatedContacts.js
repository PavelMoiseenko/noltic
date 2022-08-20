import {LightningElement, api, wire} from 'lwc';
import getRelatedContactsByAccountId from '@salesforce/apex/ContactController.getRelatedContactsByAccountId';
import addContact from '@salesforce/apex/ContactController.addContact';
import {ShowToastEvent} from "lightning/platformShowToastEvent";
import {refreshApex} from "@salesforce/apex";

export default class RelatedContacts extends LightningElement {
    @api recordId;
    showForm = false;

    @wire(getRelatedContactsByAccountId, {accountId: '$recordId'})
    contacts;

    addContact() {
        this.showForm = !this.showForm;
    }

    handleLastNameChange(event) {
        this.lastName = event.target.value;
    }

    createContact() {
        addContact({accountId: this.recordId, lastName: this.lastName})
            .then(() => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: "Success",
                        message: 'Contact was created',
                        variant: "success"
                    })
                );
                refreshApex(this.contacts);
            })
            .catch(error => console.log(error))
    }
}