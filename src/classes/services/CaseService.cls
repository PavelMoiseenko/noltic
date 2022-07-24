public class CaseService {

    public static void updateSuccessMessageOnCase(List<Case> cases) {

        Set<Id> countryIds = new Set<Id>();

        for (Case c : cases) {
            countryIds.add(c.Country__c);
        }

        Map<Id, Country__c> countryMessages = new Map<Id, Country__c>(
                CaseSelector.getSuccessMessages(countryIds)
        );

        for (Case c : cases) {
            if (c.Status == 'Closed') {
                c.SuccessMessage__c = countryMessages.get(c.Country__c).SuccessMessage__c;
            }
        }
    }

    public static void numberClosedOnCountry(List<Case> cases) {
        Set<Id> countryIds = new Set<Id>();

        for (Case c : cases) {
            if (c.Status == 'Closed') {
                countryIds.add(c.Country__c);
            }
        }

        List<AggregateResult> aggregateResults = CaseSelector.getAmountOfClosedCasesForEachCountry();
        List<Country__c> countriesToUpdate = new List<Country__c>();

        for (AggregateResult ar : aggregateResults) {
            countriesToUpdate.add(
                    new Country__c(Id = (Id) ar.get('Country__c'),
                            ClosedCases__c += (Integer) ar.get('amount'))
            );
        }

        if (countriesToUpdate.size() > 0) {
            update countriesToUpdate;
        }
    }
}
