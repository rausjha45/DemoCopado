public class DMLDemo {
    
    public static void insertDemo(){
        
        List<Account> accList = new List<Account>();
        List<Contact> conList = new List<Contact>();
        
        for(Integer i=1; i<=200; i++){
            Account acc = new Account();
            acc.Name ='Test DML Test'+i;
            acc.Active__c = 'Yes';
            acc.Phone = '98474837738';
            accList.add(acc);
        } 
        insert accList;
    }
    
    
    public static void updateDemo(){
        
        List<Account> accList = [SELECT id, Name, Rating, Industry From Account WHERE Rating ='Hot'];
        if(!accList.isEmpty()){
            for(Account acc: accList){
                acc.Industry = 'Media';
            }
            update accList;
        }   
    }
    
    public static void upsertDemo(){
        
        List<Account> accList = [SELECT id, Name, Rating, Industry From Account WHERE Rating ='Hot'];
        if(!accList.isEmpty()){
            for(Account acc: accList){
                acc.Industry = 'Energy';
            }
            
            for(Integer i=1; i<=5; i++){
                Account acc = new Account();
                acc.Name ='Test Upsert Test'+i;
                acc.Active__c = 'Yes';
                acc.Phone = '98474837738';
                accList.add(acc);
            }
            upsert accList;
        }       
    }
    
    public static void deleteDemo(){
        
        List<Account> accList = [SELECT id, Name, Rating, Industry From Account WHERE Name LIKE 'Test Upsert %'];
        
        DELETE accList;
    }
    
    public static void unDeleteDemo(){
        
        List<Account> accList = [SELECT id, Name, Rating, Industry From Account WHERE Name LIKE 'Test Upsert %' ALL ROWS];
        
        UNDELETE accList;
    }
}