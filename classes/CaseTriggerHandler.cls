public class CaseTriggerHandler {

    public static void populateCaseData(List<Case> cList){
        List<Account> accList = new List<Account>();
        for(Case cs: cList){
            if(cs.AccountId != null){
                Account acc = new Account();
                acc.id = cs.AccountId;
                acc.Latest_Case_Number__c = cs.CaseNumber;
                accList.add(acc);
            }
            update accList;
        }
    }
}