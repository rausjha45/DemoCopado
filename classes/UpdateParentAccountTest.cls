@isTest
public class UpdateParentAccountTest {

    @isTest
    public static void queueableTestMethod(){
        Account pac = new Account(Name='Parent');
        List<Account> accList = new List<Account>();
        accList.add(new Account(Name='Parent'));
        for(Integer i =1; i<=20;i++){
            Account acc = new Account();
            acc.Name = 'Testing'+i;            
            accList.add(acc);
        }
        Test.startTest();
        insert pac;
        insert accList;
        List<Account> acList = [SELECT Id,ParentId FROM Account WHERE Name Like 'Testing'];
        id pid = [SELECT Id FROM Account WHERE Name = 'Parent'][0].id;
        UpdateParentAccount up = new UpdateParentAccount(accList,pid);
		ID jobID = System.enqueueJob(up);
        Test.stopTest();
        System.assertEquals(accList.size(),[Select count() From Account Where ParentId =:pid],'Parent Account is not updated');

    }
}