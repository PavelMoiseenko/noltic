public class CaseTriggerHandler {

    public static void handle(List<Case> cases, System.TriggerOperation triggerOperation) {
        switch on triggerOperation {
            when BEFORE_UPDATE {
                CaseService.updateSuccessMessageOnCase(cases);
            }
            when AFTER_UPDATE {
                CaseService.numberClosedOnCountry(cases);
            }
        }
    }
}
