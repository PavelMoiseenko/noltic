public with sharing class DiaryController {

    @AuraEnabled(cacheable=true)
    public static List<Diary__c> getRelatedDiariesByContactId(Id contactId){
        return [SELECT Id, CreatedDate, Note__c FROM Diary__c WHERE Contact__c = : contactId];
    }

    @AuraEnabled
    public static void addDiary(Id contactId, String note) {
        insert new Diary__c( Contact__c = contactId, Note__c = note );
    }

}