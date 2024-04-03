@RestResource(urlMapping ='/Accountmgmt/')
global class AccountManagement {
    
    @httpGet
    global static List<Account> getTopAccounts(){
        Map<String,String> params = RestContext.request.params;
        Set<id> accIds = new Set<id>();
        String accIndustry = params.get('industry');
        List<Account> accList = [SELECT id, Name, AnnualRevenue,Industry,
                                 (SELECT Id, FirstName, LastName, Phone FROM Contacts),
                                 (SELECT Id, Priority, Subject FROM Cases)
                                 FROM Account 
                                 WHERE AnnualRevenue != null AND Industry =:accIndustry ORDER BY AnnualRevenue DESC];
       /* for(Account acc: accList){
            accIds.add(acc.id);
        }
        List<Contact> conList = [SELECT Id, FirstName, LastName, Phone FROM Contact WHERE AccountId IN :accIds];
        List<Case> caseList = [SELECT Id, Priority, Subject FROM Case WHERE AccountId IN :accIds];
        AccountWrapper accWrapper = new AccountWrapper();
        accWrapper.accList = accList;
        accWrapper.conList = conList;
        accWrapper.caseList =caseList;
        
        return accWrapper;*/
        return accList;
    }
    
    /*@httpPost
    global static String createAccount(String accName, String accRating, String accIndustry){
        Account acc =  new Account();
        acc.Name=accName;
        acc.Rating=accRating;
        acc.Industry=accIndustry;
        try{
            insert  acc;
            return 'Account is created successfully';
        }catch(Exception ex){
            return ex.getMessage();
        }
    }*/
    
    @httpPost
    global static String createAccountAndContact(AccountAndContact information){
        Account accountRecord = information.accRecord;
        Contact contactRecord = information.conRecord;
        try{
            insert accountRecord;
            contactRecord.AccountId = accountRecord.Id;
            insert contactRecord;
            return 'Account and Contact created Successfully';
        }catch(Exception ex){
            return ex.getMessage();
        }
    }
    
    @httpDelete
    global static String deleteRecord(){
        Map<String,String> params = RestContext.request.params;
        String accIds = params.get('accId');
        List<Account> accList = [SELECT Id FROM Account WHERE id =:accIds];
        try{
            delete accList;
            return 'Account Deleted Successfully';
        }catch(Exception ex){
            return ex.getMessage();
        }
        
    }
    
    global class AccountWrapper{
        global List<Account> accList;
        global List<Contact> conList;
        global List<Case> caseList;
    }
    
    global class AccountAndContact{
        global Account accRecord {get;set;}
        global Contact conRecord {get;set;}
    }
}