@isTest
public class AccountCalculatorTest {

    @isTest
    public static void countContactsTest(){
        List<Account> accList = new List<Account>();
        for(Integer i=1;i<=250;i++){
            accList.add(new Account(Name = 'Test '+i));
        }
        Test.startTest();
        insert accList;
        List<Contact> conList = new List<Contact>();
        List<id> accIds = new List<id>();
        for(Account acc : accList){
            Contact con = new Contact();
            con.FirstName = 'Test';
            con.LastName = acc.Name;
            con.AccountId=acc.id;
            conList.add(con);
            accIds.add(acc.id);
        }
        
        insert conList;
        AccountCalculator.countContacts(accIds);
        Test.stopTest();
        
        List<Account> accs = [SELECT id, Count_number_of_contacts__c FROM ACCOUNT];
        System.assertEquals(1,accs[0].Count_number_of_contacts__c ,'Contact is not counted successfully');
        
    }
}