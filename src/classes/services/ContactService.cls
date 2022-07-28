public class ContactService {

    public static void updateAccountType(List<Contact> newListContacts, List<Contact> oldListContacts) {

        Set<Id> accountIds = new Set<Id>();

        if (newListContacts != null) {
            for (Contact c : newListContacts) {
                if (c.AccountId != null) {
                    accountIds.add(c.AccountId);
                }
            }
        }

        if (oldListContacts != null) {
            for (Contact c : oldListContacts) {
                if (c.AccountId != null) {
                    accountIds.add(c.AccountId);
                }
            }
        }

        List<Account> accounts = ContactSelector.getAccountsByIds(accountIds);

        if (!accounts.isEmpty()) {
            for (Account acc : accounts) {
                Integer countContacts = acc.Contacts.size();

                if (countContacts == 1) {
                    acc.Type__c = 'Personal';
                } else if (countContacts > 1 && countContacts < 100) {
                    acc.Type__c = 'Business';
                } else if (countContacts >= 100) {
                    acc.Type__c = 'Company';
                }
                else{
                    acc.Type__c = '';
                }

            }
        }

        update accounts;
    }
}