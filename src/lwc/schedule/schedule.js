import {LightningElement, wire} from "lwc";
import getInterviewsOfWeek from '@salesforce/apex/InterviewController.getInterviewsOfWeek';

export default class Schedule extends LightningElement {
    @wire(getInterviewsOfWeek, {})
    interviews;
}