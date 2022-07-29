public class CaseSelector {

    public static List<Country__c> getSuccessMessages(Set<Id> countryIds) {
        return [SELECT SuccessMessage__c FROM Country__c WHERE Id IN :countryIds];
    }

    public static List<Country__c> oldValuesClosedCasesByCountry(Set<Id> countryIds){
        return [SELECT ClosedCases__c FROM Country__c WHERE Id IN :countryIds];
    }
}
