trigger CaseTrigger on Case (before update, after update) {
    CaseTriggerHandler.handle(Trigger.new, Trigger.operationType);
}
