public class AccountRecord {
    
    public static void queryAccount(){
        List<Account> accList = [SELECT Id,Name,Phone FROM Account Where Phone ='123456'];
        System.debug(accList);
        if(!accList.isEmpty()){
            for(Account acc:accList){
                acc.Phone = '654321';
            }
            update accList;
        }
    }
    
    /*public static Id insertAccount(){
        Account acc = new Account();
        acc.Name = 'Account 113';
        acc.Active__c = 'Yes';
        acc.Rating = 'Hot';
        insert acc;
        return acc.Id;
    }
    
    public static void insertAccountWithContact(){
        Id accId = insertAccount();
        Contact con = new Contact();
        con.FirstName = 'Contact ';
        con.LastName = '117';
        con.AccountId=accId;
        System.debug(accId);
        insert con;

        
    }*/
    
    public static void insertAccountWithContactAndOpportunity(){
        Account acc = new Account();
        acc.Name = 'Account 113';
        acc.Active__c = 'Yes';
        acc.Rating = 'Hot';
        insert acc;
        
        Contact con = new Contact();
        con.FirstName = 'Contact ';
        con.LastName = '117';
        con.AccountId=acc.Id;
        insert con;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Opp 106';
        opp.CloseDate= System.Today();
        opp.StageName = 'Need Analysis';
        opp.AccountId=acc.Id;
        insert opp;
        
    }

}