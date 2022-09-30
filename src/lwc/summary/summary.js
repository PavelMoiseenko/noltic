import {LightningElement, api, wire} from 'lwc';
import getInterviewsByCandidateId from '@salesforce/apex/InterviewController.getInterviewsByCandidateId';

export default class Summary extends LightningElement {
    @api recordId;

    @wire(getInterviewsByCandidateId, {candidateId: '$recordId'})
    interviews;
}