@IsTest
private class ChangeAccountNameBatchTest {
    @IsTest
    static void testChangeAccountName() {
        Account acc = new Account();
        acc.Name = 'My test account';
        insert acc;

        Test.startTest();
        ChangeAccountNamesBatch myBatchObj = new ChangeAccountNamesBatch();
        Id batchId = Database.executeBatch(myBatchObj);
        Test.stopTest();
        Account testAcc = [SELECT Id, Name FROM Account WHERE Id =: acc.Id];
        System.assertEquals('My test account Batch Processed', testAcc.Name);
    }
}