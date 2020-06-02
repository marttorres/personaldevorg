@isTest(SeeAllData = false)
public class TestVerifyDate {    
    @isTest static void CheckDatesIf() {
        Date date1 = Date.newInstance(2018, 5, 1);
        Date date2 = date1.addDays(30);
        Date dateResult = VerifyDate.CheckDates(date1, date2);        
        System.assertEquals(date2, dateResult);
    }
    
    @isTest static void CheckDatesElse() {
        Date date1 = Date.newInstance(2018, 5, 1);                
        Date date2 = date1.addDays(10);
		Integer totalDays = Date.daysInMonth(date1.year(), date1.month());
		Date lastDay = Date.newInstance(date1.year(), date1.month(), totalDays);
        Date dateResult = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(lastDay, dateResult);
    }
}