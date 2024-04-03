public class CandidateTriggerHandler {

    public static void sendEmail(List<Candidate__c> canList){
        List<Messaging.Email> emailList = new List<Messaging.Email>();
        for(Candidate__c can:canList){
                if(can.Email__c != null){
                    Messaging.singleEmailMessage emailMsg = new Messaging.singleEmailMessage();
                    String[] toAddress = new String[]{can.Email__c};
                    emailMsg.setToAddresses(toAddress);
                    String emailSub = 'Welcome '+can.First_Name__c;
                    emailMsg.setSubject(emailSub);
                    String disName = 'Raushan';
                    emailMsg.setSenderDisplayName(disName);
                    
                    String emailBody = 'Hi '+can.First_Name__c + ' ,<br/><br/>'+
                        ' Welocme to Salesforce ecosystem! <br/><br/>' +
                        ' Thankyou';
                    emailMsg.setHtmlBody(emailBody);
                    emailList.add(emailMsg);
                    
                }
        }
        Messaging.sendEmail(emailList);
    }
    
    public static void validateExistingRecordBasedOnEmail(List<Candidate__c> canList){
        
        Set<String> emails = new Set<String>();
        Set<String> existingEmails = new Set<String>();
        
        for(Candidate__c can: canList){
            if(can.Email__c != null){
                emails.add(can.Email__c);
            }  
        }
         System.debug(emails);
        List<Candidate__c> existingCandidateList = [SELECT id, Email__c FROM Candidate__c WHERE 
                                                    Email__c IN :emails];
        System.debug(existingCandidateList);
        
        for(Candidate__c can: canList){
            if(existingCandidateList.size()>1){
                can.Email__c.addError('Duplicate Email Found');
            }
        }
    }
}