public with sharing class AccountController {

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList(){
        try {
            return [SELECT id, Name, Rating, AnnualRevenue FROM Account WITH SECURITY_ENFORCED LIMIT 10];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
}