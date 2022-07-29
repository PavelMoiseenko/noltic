@IsTest
private class CaseServiceTest {

    @IsTest
    static void testSuccessMessageIsStatusClosed(){
        //given
        Country__c country = new Country__c(Name='Test country', SuccessMessage__c='Hello, trailblazer! This is greeting from Test country' );
        insert country;

        Case customCase = new Case(
                Status='Working',
                Origin='Phone',
                Country__c = country.Id
        );
        insert customCase;

        customCase.Status = 'Closed';

        //when
        Test.startTest();
            update customCase;
        Test.stopTest();

        //then
        Case caseFromDb = [SELECT Id, SuccessMessage__c FROM Case WHERE Id= :customCase.Id ];
        System.assertEquals('Hello, trailblazer! This is greeting from Test country', caseFromDb.SuccessMessage__c);
    }

}