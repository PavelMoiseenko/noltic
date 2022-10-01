public with sharing class InterviewService {

    public static void validateQuantityInterviewForCustomerPerWeek(List<Interview__c> interviews) {

        for (Interview__c i : interviews) {
            List<Interview__c> interviewsWithCustomer = InterviewSelector.getInterviewsWithCustomer(i.Customer__c);

            if (interviewsWithCustomer.size() > 3) {
                i.addError('Three interviews are already created for ' + interviewsWithCustomer[0].Customer__r.LastName + ' this week.');
            }
        }
    }

}