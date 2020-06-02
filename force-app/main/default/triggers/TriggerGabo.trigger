trigger TriggerGabo on Account (after insert) {
    TareaGaboCls.insertarContact(Trigger.new);
}