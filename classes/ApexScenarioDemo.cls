public class ApexScenarioDemo {
    
    public static void apexScenarioContact(){
        List<Account> accList = [SELECT id,Name,(SELECT Id,FirstName,LastName FROM Contacts) 
                                 FROM Account WHERE Phone != 'null' ];
        
        if(!accList.isEmpty()){
            for(Account acc : accList){
                System.debug('Account Name: '+acc.Name + ' has '+acc.Contacts.size()+ ' related Contact List'); 
            }
        }
    }
    
    public static void apexScenario2Contact(){
        List<Account> accList = [SELECT id, Name,Total_Contacts__c, CreatedDate, (SELECT id FROM Contacts) 
                                 FROM Account WHERE CreatedDate = This_Year];
        
        if(!accList.isEmpty()){
            for(Account acc : accList){
                If(acc.Contacts.size() >0){
                    acc.Total_Contacts__c = acc.Contacts.size();
                }else{
                    acc.Total_Contacts__c = 0;
                }
            }
            update accList;
        }
    }
    
    public static void apexScenario3Contact(){
        List<Contact> conList = [SELECT Id,MobilePhone,Account.Phone, CreatedDate FROM Contact WHERE CreatedDate = Last_Week];
        
        if(!conList.isEmpty()){
            for(Contact con : conList){
                if(con.MobilePhone == null && con.Account.Phone != null){
                    con.MobilePhone = con.Account.Phone;
                }
            }
            update conList;
        }   
    }
    
    
    public static void apexScenarioOpportunity(){
        List<Account> accList = [SELECT id,Name,(SELECT Id,Amount FROM Opportunities) 
                                 FROM Account WHERE Phone != 'null' ];
        
        if(!accList.isEmpty()){ 
            for(Account acc : accList){
                Decimal total =0;
                for(Opportunity opp : acc.Opportunities){
                    if(opp.Amount != null){
                         total = total+opp.Amount;
                    }
                }
                System.debug('Account Name: '+acc.Name + ' has Total '+total+ ' worth Opportunities');
            }
            
        }
    }
    
    public static void apexScenario2Opportunity(){
        List<Opportunity> oppList = [SELECT Id,StageName,Description,CreatedDate  FROM Opportunity WHERE CreatedDate = This_Year];
        
        if(!oppList.isEmpty()){ 
            for(Opportunity opp : oppList){
                if(opp.StageName == 'closed won'){
                    opp.Description = 'Opportunity is closed Won';
                }else if(opp.StageName == 'closed lost'){
                    opp.Description = 'Opportunity is closed Lost';
                }else{
                    opp.Description = 'Opportunity is Open';
                }
            }
            update oppList;
        }
    }

}