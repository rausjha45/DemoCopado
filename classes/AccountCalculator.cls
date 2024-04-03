public class AccountCalculator {
    
    @future
    public static void countContacts(List<id> accIds){
        List<Account> accList = [SELECT id,Count_number_of_contacts__c, (SELECT id FROM Contacts)
                                FROM Account WHERE id IN: accIds];
        for(Account acc: accList){
            acc.Count_number_of_contacts__c = acc.Contacts.size();
        }
        if(!accList.isEmpty()){
            update accList;
        }
    }

}