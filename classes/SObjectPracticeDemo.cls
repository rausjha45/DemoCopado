public class SObjectPracticeDemo {
    
    public static void queryContact(){
        List<Contact> conList = [SELECT Id,FirstName,LastName,Email FROM Contact Where Email=null];
        
        if(!conList.isEmpty()){
            for(Contact con:conList){
                con.Email = 'Test@test.com';
            }
            update conList;
        }
    }
    
    public static void queryAccount(){
        List<Account> accList = [SELECT Id,Name,Phone FROM Account Where Phone ='654321'];
        System.debug(accList);
        if(!accList.isEmpty()){
            for(Account acc:accList){
                acc.Phone = '123456';
            }
            For(Integer i=1;i<=5;i++){
                Account acc = new Account();
                acc.Name = 'Test Upsert Test '+i;
                acc.Active__c = 'No';
                acc.AnnualRevenue = 4546533;
                acc.Rating = 'Hot';
                accList.add(acc);
                
            }
            upsert accList;
            
        }
    }
    
    public static void queryOpportunity(){
        List<Opportunity> oppList = [SELECT Id,Name,CloseDate, StageName FROM Opportunity Where CreatedDate =This_Month];
        System.debug(oppList);
        if(!oppList.isEmpty()){
            for(Opportunity opp:oppList){
                opp.StageName = 'Closed Won';
            }
            For(Integer i=1;i<=5;i++){
                Opportunity op = new Opportunity();
                op.Name = 'Test Upsert Test '+i;
                op.CloseDate = System.TODAY();
                op.StageName = 'Closed Won';
                oppList.add(op);
                
            }
            upsert oppList;
            
        }
    }
    
    public static void deleteAccount(){
        List<Account> accList = [SELECT Id, Name FROM Account Where Phone = '123456'];
        
        delete accList;
    }
    
    public static void unDeleteAccount(){
        List<Account> accList = [SELECT Id, Name FROM Account Where Phone = '123456' ALL ROWS];
        
        undelete accList;
    }
    
    public static void queryAccountLast7Days(){
        List<Account> accList = [SELECT Id,Name,Phone FROM Account Where CreatedDate =Last_Week];
        if(!accList.isEmpty()){
            for(Account acc:accList){
                acc.Phone = '1234567890';
            }
            update accList;
            
        }
    }
}