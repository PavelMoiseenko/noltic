public class CollectionHandler {

    //Practical Task1: Get unique values in list.
    public List<Integer> getUniqueValues(List<Integer> arr) {
        List<Integer> uniqueValues = new List<Integer>();

        for (Integer val : arr) {
            if (!uniqueValues.contains(val)) {
                uniqueValues.add(val);
            }
        }

        return uniqueValues;
    }

    //Practical Task2: Get Contact by Name.
    public Contact getContactByName(String name) {

        Contact lookingFor;
        //Create test list of contacts with names from list of names
        List<Contact> contacts = new List<Contact>();
        List<String> names = new List<String>{
                'Andrii', 'Petro', 'Iryna', 'Pavlo', 'Dmytro', 'Svitlana', 'Anna'
        };

        for (String val : names) {
            Contact contact = new Contact(FirstName = val);
            contacts.add(contact);
        }

        //Get contact with requested name
        for (Contact contact : contacts) {
            if (contact.FirstName == name) {
                lookingFor= contact;
                break;
            }

        }

        return lookingFor;

    }

    //Practical Task3: Get Opportunity with the biggest amount
    public Opportunity getOpportunityMaxAmount(){
        //Create test list of opportunities
        Opportunity oppWithMaxAmount;
        List<Integer> listValues = new List<Integer>{100, 250, 10, 1100, 700, 350, 2500, 200, 770};
        List<Opportunity> opportunities = new List<Opportunity>();

        for(Integer val : listValues){
            Opportunity opp = new Opportunity(Amount=val);
            opportunities.add(opp);
        }

        //Get opportunity with the biggest amount
        for(Opportunity opp : opportunities){

            if(oppWithMaxAmount == null){
                oppWithMaxAmount = opportunities[0];
            }

            if(opp.Amount > oppWithMaxAmount.Amount){
                oppWithMaxAmount = opp;
            }
        }

        return oppWithMaxAmount;

    }

    //Practical Task4: Write a function that takes a number and returns a list of its digits.
    public List<Integer> getDigitsFromNumber(Integer num) {
        List<Integer> digits = new List<Integer>();
        List<Integer> reverseDigits = new List<Integer>();

        while (num > 0) {
            digits.add(Math.mod(num, 10));
            num /= 10;
        }

        //Make reverse order of digits
        for(Integer i = digits.size() - 1; i >= 0; i--){
            reverseDigits.add(digits[i]);
        }

        return reverseDigits;
    }
}


//Test for method getUniqueValues
//
//CollectionHandler ch = new CollectionHandler();
//List<Integer> testList = new List<Integer>{10, 3, 3, 10, 12, 11, 115, 2, 1};
//System.debug(ch.getUniqueValues(testList));


//Test for method getContactByName
//
//CollectionHandler ch = new CollectionHandler();
//System.debug(ch.getContactByName('Anna'));

//Test for method getOpportunityMaxAccount
//
//CollectionHandler ch = new CollectionHandler();
//System.debug(ch.getOpportunityMaxAmount());

//Practical Task4: Write a function that takes a number and returns a list of its digits.
//
//CollectionHandler ch = new CollectionHandler();
//System.debug(ch.getDigitsFromNumber(6478945));