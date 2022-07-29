public class CaseService {

    public static void updateSuccessMessageOnCase(List<Case> cases) {

        Set<Id> countryIds = new Set<Id>();

        for (Case c : cases) {
            if (c.Status == 'Closed') {
                countryIds.add(c.Country__c);
            }
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

        Map<Id, Integer> closedCasesByCountry = new Map<Id, Integer>();
        for (Case c : cases) {
            if (c.Status == 'Closed') {
                Integer currentAmount = closedCasesByCountry.get(c.Country__c);

                if (currentAmount != null) {
                    currentAmount++;
                } else {
                    currentAmount = 1;
                }
                closedCasesByCountry.put(c.Country__c, currentAmount);
            }
        }

        Set<Id> countryIds = closedCasesByCountry.keySet();

        List<Country__c> oldValuesClosedCasesByCountry = CaseSelector.oldValuesClosedCasesByCountry(countryIds);

        Map<Id, Country__c> countries = new Map<Id, Country__c>();

        for (Country__c c : oldValuesClosedCasesByCountry) {
            countries.put(c.Id, c);
        }

        List<Country__c> countriesToUpdate = new List<Country__c>();
        for (Id countryId : closedCasesByCountry.keySet()) {

            countriesToUpdate.add(
                    new Country__c(
                            Id = countryId,
                            ClosedCases__c = countries.get(countryId).ClosedCases__c + closedCasesByCountry.get(countryId)
                    )
            );

        }

        update countriesToUpdate;
    }
}












