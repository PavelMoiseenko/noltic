public class MorningCaseCreatorScheduler implements Schedulable {

    public void execute(SchedulableContext ctx) {
        Datetime currentDate = Datetime.now();
        String formattedCurrentDate = currentDate.format('dd/MM/YYYY');
        Case caseObj = new Case();
        caseObj.Subject = 'Morning Case - ' + formattedCurrentDate;
        caseObj.Origin = 'Phone';
        insert caseObj;
    }
}

//Code to check
//MorningCaseCreatorScheduler reminder = new MorningCaseCreatorScheduler();
//String sch = '0 0 7 * * ?';
//String jobID = System.schedule('Case Creator', sch, reminder);