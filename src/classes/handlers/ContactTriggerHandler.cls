public class ContactTriggerHandler {

    public static void handle(List<Contact> newListContacts, List<Contact> oldListContacts, System.TriggerOperation triggerOperation) {
        switch on triggerOperation {
            when AFTER_INSERT, AFTER_UPDATE, AFTER_DELETE, AFTER_UNDELETE {
                ContactService.updateAccountType(newListContacts, oldListContacts);
            }
        }
    }
}