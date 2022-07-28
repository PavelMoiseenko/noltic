trigger ContactTrigger on Contact (after insert, after update, after delete, after undelete) {
    ContactTriggerHandler.handle(Trigger.new, Trigger.old, Trigger.operationType);
}