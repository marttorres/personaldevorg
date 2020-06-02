trigger TriggerShipping on Account (before insert, before update) {
    if(Trigger.isInsert) {
        TriggerShippingCls.metodoTriggerInsert(Trigger.new);        
    }
    
    if(Trigger.isUpdate) {
        TriggerShippingCls.metodoTriggerUpdate(Trigger.new);           
    }
}