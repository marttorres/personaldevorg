trigger TriggerGaboContact on Contact (before update) {
    TareaGaboCls.updateAccount(Trigger.new);
}