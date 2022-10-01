public with sharing class InterviewSelector {

    public static List<Interview__c> getInterviewsWithCustomer(Id customerId) {
        return [SELECT Id, Customer__r.LastName FROM Interview__c WHERE Customer__c = :customerId AND Meeting__c = NEXT_N_DAYS:7];
    }

}