global class ScheduleExamenMartin implements Schedulable {
    global void execute(SchedulableContext ctx) {
        //Get all opportunities with stage 'Prospecting'
        List<Opportunity> listOpportunities = [SELECT Id, Name FROM Opportunity WHERE StageName = 'Prospecting'];
        
        //Update name for each opportunity
        for (Opportunity objOpportunity : listOpportunities) {
            objOpportunity.Name = objOpportunity.Name + ' _schedule';
        }
        
        update listOpportunities;
    }
}