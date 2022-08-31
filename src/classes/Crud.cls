@RestResource(UrlMapping='/contact/*')
global class Crud {

    final static String lastEndpointSection = 'contact';

    @HttpGet
    global static void getContacts() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;

        String contactId = req.requestUri.substring(
                req.requestURI.lastIndexOf(lastEndpointSection) + lastEndpointSection.length())
                .removeStart('/');
        if (String.isBlank(contactId)) {
            res.statusCode = 400;
            res.responseBody = Blob.valueOf('Contact Id is missing');

            return;
        }

        res.headers.put('Content-Type', 'application/json');
        res.responseBody = Blob.valueOf(JSON.serializePretty([
                SELECT Id, Name
                FROM Contact
                WHERE Id = :contactId
        ]));
    }

    @HttpPost
    global static void createContact(String name, String phone) {
        RestResponse res = RestContext.response;

        Contact contact = new Contact();
        contact.LastName = name;
        contact.Phone = phone;
        insert contact;

        res.headers.put('Content-Type', 'application/json');
        res.responseBody = Blob.valueOf(JSON.serialize(contact));
    }

    @HttpPatch
    global static void updateContact(String name) {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String contactId = req.requestUri.substring(
                req.requestURI.lastIndexOf(lastEndpointSection) + lastEndpointSection.length())
                .removeStart('/');
        if (String.isBlank(contactId)) {
            res.statusCode = 400;
            res.responseBody = Blob.valueOf('Contact Id is missing');

            return;
        }

        List<Contact> contacts = [SELECT Id FROM Contact WHERE Id = :contactId];
        if (contacts.isEmpty()){
            res.statusCode = 404;
            res.responseBody = Blob.valueOf('Contact not found.');

            return;
        }

        Contact contact = contacts.get(0);

        contact.LastName = name;
        update contact;

        res.headers.put('Content-Type', 'application/json');
        res.responseBody = Blob.valueOf(JSON.serialize(contact));
    }

    @HttpDelete
    global static void deleteContact() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;

        String contactId = req.requestUri.substring(
                req.requestURI.lastIndexOf(lastEndpointSection) + lastEndpointSection.length())
                .removeStart('/');
        if (String.isBlank(contactId)) {
            res.statusCode = 400;
            res.responseBody = Blob.valueOf('Contact Id is missing');

            return;
        }
        List<Contact> contacts = [SELECT Id FROM Contact WHERE Id = :contactId];
        if (contacts.isEmpty()){
            res.statusCode = 404;
            res.responseBody = Blob.valueOf('Contact not found.');

            return;
        }

        delete contacts;

    }
}