public class CSVEmailAttached {
    
    public void createEmail() {
        String THECSVDATA ='';
        THECSVDATA += '<strong>Id</strong>,Name,Phone\n';
		for(Account evnt : [SELECT Id, Name, Phone FROM Account LIMIT 5]){
            
        List<String> csvRow = new List<String>();
            csvRow.add((String.valueOf(evnt.Id) != null)?String.valueOf(evnt.Id):'');
            csvRow.add((String.valueOf(evnt.Name) != null)?String.valueOf(evnt.Name):'');
            csvRow.add((String.valueOf(evnt.Phone) != null)?String.valueOf(evnt.Phone):'');
            String appData = listToCSVStringConverter(csvRow);
            THECSVDATA = THECSVDATA + appData;
        }
     sYSTEM.debug('' +THECSVDATA );
        Messaging.EmailFileAttachment csvAttachment = new Messaging.EmailFileAttachment();
        Blob csvBlob = blob.valueOf(THECSVDATA);

        String csvName = 'Test.csv';
        csvAttachment.setFileName(csvName);
        csvAttachment.setBody(csvBlob);

        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();

        String[] toAddresses = new String[] {'martin.torres.solorzano@hotmail.com'};

        String subject = 'Event CSV)';
        email.setSubject(subject);
        email.setToAddresses(toAddresses);
        email.setPlainTextBody('Attached is the event csv.');
        email.setFileAttachments(new Messaging.EmailFileAttachment[]{csvAttachment});
        Messaging.SendEmailResult[] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email}); 
    }
    
    public static String listToCSVStringConverter(List<String> theString) {
        String returnString = '';
        String finalString = '';
        for(String newStr : theString) {
            returnString += newStr.escapeCsv() +',';
        }
        finalString =  returnString.removeEnd(',') + '\n';
    	return finalString;
	}
      
}