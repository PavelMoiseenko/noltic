public with sharing class InterviewController {

    @AuraEnabled(cacheable=true)
    public static List<Interview__c> getInterviewsByCandidateId(Id candidateId) {
        return [SELECT Name, Status__c  FROM Interview__c WHERE Candidate__c = :candidateId];
    }
    @AuraEnabled(cacheable=true)
    public static List<Interview__c> getInterviewsOfWeek() {
        return [SELECT Name, Meeting__c, Vacancy__r.Name, Candidate__r.Name, Customer__r.Name FROM Interview__c WHERE Meeting__c = NEXT_N_DAYS:7 ];
    }
}