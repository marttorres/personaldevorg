public class EmailReportSender {
    public void createEmail() {
        /*
        EmailTemplate et = [SELECT Id,Subject, Body FROM EmailTemplate WHERE DeveloperName = 'ReportEmail'];
        List<string> toAddress = new List<string>();
        toAddress.add('martin.torres.solorzano@hotmail.com');
        String email
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setTemplateId(et.Id);
            mail.setToAddresses(toAddress);
            mail.setSubject(et.subject);
            mail.setHTMLBody(et.Body);
            mail.setTargetObjectId(primaryContact);
            mail.setWhatId(primaryAccount);
            mail.setSaveAsActivity(false);
            mail.setUseSignature(false);
        List<Messaging.SingleEmailMessage> allmsg = new List<Messaging.SingleEmailMessage>();
        allmsg.add(mail);
        
        try {
            Messaging.sendEmail(allmsg,false);
            return;
        } catch (Exception e) {
            System.debug(e.getMessage());
        }*/
    }
}