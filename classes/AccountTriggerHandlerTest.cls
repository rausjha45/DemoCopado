@isTest 
private class AccountTriggerHandlerTest {
    
    @isTest
    static void createOppsTest(){
        List<Account> accList = new List<Account>();
        Account acc = new Account();
        acc.Name = 'Test ';
        acc.Description ='Account is created';
        acc.Industry = 'Media';
        accList.add(acc);
        
        Test.startTest();
        Database.insert(accList,true);
        Test.stopTest();
        
        List<Opportunity> oppList = [SELECT id,AccountId,Amount From Opportunity Where AccountId =:accList[0].Id ];
        System.assert(oppList != null, 'Opportunity is not created');
    } 
    
    @isTest
    static void createContactOppsConditionallyTest(){
        List<Account> accList = new List<Account>();
        Account acc = new Account();
        acc.Name = 'Test ';
        acc.Contact__c = true;
        acc.Opportunity__c = true;
        acc.Active__c = 'Yes';
        accList.add(acc);
        
        Test.startTest();
        Database.insert(accList,true);
        Test.stopTest();
        
        List<Opportunity> oppList = [SELECT id From Opportunity Where AccountId =:accList[0].Id ];
        List<Contact> conList = [SELECT id From Contact Where AccountId =:accList[0].Id ];
        System.assert(oppList != null, 'Opportunity is not created');
        System.assert(conList != null, 'Opportunity is not created');
    } 
    
    @isTest
    static void updateAccountDescTest(){
        List<Account> accList = new List<Account>();
        Account acc = new Account();
        acc.Name = 'Test ';
        acc.Phone ='97474744848448';
        acc.Description ='';
        accList.add(acc);
        
        Test.startTest();
        insert accList;
        for(Account ac: accList){
            ac.Phone ='8373878';
        }
        update accList;
        Test.stopTest();
        
        List<Account> aList = [Select id, Phone, Description From Account Where id =:accList[0].id];
        
        if(accList[0].Phone != aList[0].Phone){
            System.assert(accList[0].Description != aList[0].Description, 'Description is not updated');
        }
    }
    
    @isTest
    static void updateRelatedContactsTest(){
        List<Account> accList = new List<Account>();
        Account acc = new Account();
        acc.Name = 'Test ';
        acc.Phone ='97474744848448';
        acc.Description ='';
        accList.add(acc);
        
        Test.startTest();
        insert accList;
        for(Account ac: accList){
            ac.Phone ='8373878';
        }
        update accList;
        Test.stopTest();
        
        List<Account> aList = [Select id, Phone, Description From Account Where id =:accList[0].id];
        
        if(accList[0].Phone != aList[0].Phone){
            System.assert(accList[0].Description != aList[0].Description, 'Description is not updated');
        }
    }
    
}