@IsTest
private class AccountControllerTest {
    @IsTest
    static void testCreateAccountFuture(){
        String accName = 'My test name';

        Test.startTest();
        AccountController.createAccountFuture(accName);
        Test.stopTest();

        Account acc = [SELECT Id, Name FROM Account WHERE Name =: accName];
        System.assertEquals ( accName, acc.Name);
    }
}