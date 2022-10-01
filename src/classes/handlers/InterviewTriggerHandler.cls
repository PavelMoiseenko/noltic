public with sharing class InterviewTriggerHandler {

    public static void handle(List<Interview__c> interviews, System.TriggerOperation triggerOperation) {
        switch on triggerOperation {
            when BEFORE_INSERT {
                InterviewService.validateQuantityInterviewForCustomerPerWeek(interviews);
            }
        }
    }

}
