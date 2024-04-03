public class ContactTriggerHandler {
    
    public static void totalContactCount(List<Contact> conList){
        
        List<Account> accList = new List<Account>();
        Set<id> accIds = new Set<Id>();
        
        for(Contact con : conList){
            if(con.AccountId != null){
                accIds.add(con.AccountId);
            }
        }
        for(Account acc : [SELECT id, (SELECT id FROM Contacts) 
                           FROM Account WHERE id IN : accIds] ){
                               acc.Total_Contacts__c = acc.Contacts.size();
                               accList.add(acc);
                           }
        if(!accList.isEmpty()){
            update accList;
        }
    }

}