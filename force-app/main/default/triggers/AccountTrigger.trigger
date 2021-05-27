trigger AccountTrigger on Account (before insert, before update, after insert, after update) {

    //instanciando classe
    AccountTriggerHandler handler = new AccountTriggerHandler();

    // Atribuindo listas e mapas:
    handler.newRecordList = trigger.new;
    handler.oldRecordList = trigger.old;
    handler.newRecordMap = trigger.newMap;
    handler.oldRecordMap = trigger.oldMap;

    //update e inserte dentro do before:
    if(trigger.isBefore) { 
        if(trigger.isUpdate) {
        handler.onBeforeUpdate();
        }

        if(trigger.isInsert) {
        handler.onBeforeInsert();
        }
    } else {
        if(trigger.isInsert) {
        handler.onAfterInsert();
        }

        if (trigger.isUpdate) {
        handler.onBeforeUpdate();
        }
    }
}