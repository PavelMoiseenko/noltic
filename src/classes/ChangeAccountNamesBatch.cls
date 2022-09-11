public class ChangeAccountNamesBatch implements Database.Batchable<sObject>{
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT ID, Name FROM Account');
    }
    public void execute(Database.BatchableContext bc, List<Account> accounts){
        for (Account account : accounts) {
            account.Name = account.Name + ' Batch Processed';
        }
        update accounts;
    }
    public void finish(Database.BatchableContext bc){
        System.debug('Accounts were processed.');
    }
}