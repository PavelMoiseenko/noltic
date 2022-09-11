public with sharing class AccountController {

    @future
    public static void createAccountFuture(String accountName){
        Account acc = new Account();
        acc.Name = accountName;
        insert acc;
    }

}