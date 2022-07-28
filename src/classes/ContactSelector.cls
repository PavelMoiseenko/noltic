public class ContactSelector {

    public static List<Account> getAccountsByIds(Set<Id> accountIds) {
        return [SELECT Id, (SELECT Id FROM Contacts) FROM Account WHERE Id IN :accountIds];
    }
}