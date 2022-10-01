trigger InterviewTrigger on Interview__c (before insert) {
    InterviewTriggerHandler.handle(Trigger.new, Trigger.operationType);
}