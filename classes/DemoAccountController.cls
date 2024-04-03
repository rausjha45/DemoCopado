public class DemoAccountController {

    @AuraEnabled
    public static  List<Account> getAccount(){
        List<Account> accList = [SELECT id, Name,AnnualRevenue,Type FROM Account LIMIT 20];
        return accList;
    }
}