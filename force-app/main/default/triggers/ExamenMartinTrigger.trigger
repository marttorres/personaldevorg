trigger ExamenMartinTrigger on Actor__c (after insert) {
	ExamenMartinTriggerCls.insertarPersonajes(Trigger.new);
}