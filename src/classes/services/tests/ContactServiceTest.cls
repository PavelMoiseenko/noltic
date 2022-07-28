@IsTest
private class ContactServiceTest {

    @IsTest
    static void testAccountTypePersonal() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        Id accId = acc.Id;
        Contact testContact = new Contact(LastName = 'Dow', AccountId = accId);

        Test.startTest();
        insert testContact;
        Test.stopTest();

        List<Account> accTest = [SELECT Id, Type__c FROM Account WHERE Name = 'Test Account'];
        System.assertEquals('Personal', accTest[0].Type__c);
    }

    @IsTest
    static void testAccountTypeBusiness() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        Id accId = acc.Id;

        List<Contact> contacts = new List<Contact>();
        Contact firstContact = new Contact(LastName = 'Dow', AccountId = accId);
        Contact secondContact = new Contact(LastName = 'Jhon', AccountId = accId);
        contacts.add(firstContact);
        contacts.add(secondContact);

        Test.startTest();
        insert contacts;
        Test.stopTest();

        List<Account> accTest = [SELECT Id, Type__c FROM Account WHERE Name = 'Test Account'];
        System.assertEquals('Business', accTest[0].Type__c);
    }

    @IsTest
    static void testAccountTypeAfterRemovingAllContacts() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        Id accId = acc.Id;

        Contact firstContact = new Contact(LastName = 'Dow', AccountId = accId);
        insert firstContact;

        Test.startTest();
        delete firstContact;
        Test.stopTest();

        List<Account> accTest = [SELECT Id, Type__c FROM Account WHERE Name = 'Test Account'];
        System.assertEquals(null, accTest[0].Type__c);
    }
}