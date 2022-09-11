@IsTest
private class CreateAccountQueueableTest {
    @IsTest
    static void testCreateAccountQueueable() {
        Account acc = new Account();
        acc.Name = 'Test account';
        insert acc;

        Test.startTest();
        CreateAccountQueueable queueableObj = new CreateAccountQueueable('Test account');
        ID jobID = System.enqueueJob(queueableObj);
        Test.stopTest();
        Account testAcc = [SELECT Id, Name FROM Account WHERE Name =: acc.Name LIMIT 1];
        System.assertEquals('Test account', testAcc.Name);
    }
}