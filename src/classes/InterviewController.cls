public with sharing class InterviewController {

    @AuraEnabled(cacheable=true)
    public static List<Interview__c> getInterviewsByCandidateId(Id candidateId) {
        return [SELECT Name, Status__c  FROM Interview__c WHERE Candidate__c = :candidateId];
    }
}