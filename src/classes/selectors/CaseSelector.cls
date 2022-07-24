public class CaseSelector {

    public static List<Country__c> getSuccessMessages(Set<Id> countryIds) {
        return [SELECT SuccessMessage__c FROM Country__c WHERE Id IN :countryIds];
    }

    public static List<AggregateResult> getAmountOfClosedCasesForEachCountry(){
        return [SELECT Country__c, COUNT(Id) amount FROM Case GROUP BY Country__c];
    }
}
