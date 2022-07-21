public class OpportunityUtility {

    public static List<Opportunity> updateOpportunityStage(String oldStage, String newStage) {
        List<Schema.PicklistEntry> opportunityStages =
                Opportunity.StageName.getDescribe().getPicklistValues();

        List<String> validPicklistValuesOpp = new List<String>();

        for (Schema.PicklistEntry entry : opportunityStages) {
            validPicklistValuesOpp.add(entry.value);
        }

        if (!validPicklistValuesOpp.contains(oldStage) || !validPicklistValuesOpp.contains(newStage)) {
            System.debug('Invalid values for Opportunity');
            return null;
        }

        List<Opportunity> listOpportunities = [SELECT Id, Name, StageName FROM Opportunity WHERE StageName = :oldStage];

        for (Opportunity op : listOpportunities) {
            op.StageName = newStage;
        }

        try {
            update listOpportunities;
            //System.debug(listOpportunities);
            return listOpportunities;
        } catch (DmlException e) {
            System.debug('A DML exception has occurred: ' + e.getMessage());
            return null;
        }
    }

}

//Code for testing
//OpportunityUtility.updateOpportunityStage('Qualification', 'Prospecting' );