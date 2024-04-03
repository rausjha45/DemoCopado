public class AccountTriggerHandler {
    
    public static void createContactConditionally(List<Account> accList, Map<Id,Account> accOldMap){
        List<Contact> conList = new List<Contact>();
        List<Contact> conDelList = new List<Contact>();
        for(Account acc : accList){
            if((Integer)acc.Total_Contacts__c != (Integer)accOldMap.get(acc.id).Total_Contacts__c){
                Integer newContacts =(Integer)acc.Total_Contacts__c - (Integer)accOldMap.get(acc.id).Total_Contacts__c;
               	if(newContacts>0){
                    for(Integer i= (Integer)accOldMap.get(acc.id).Total_Contacts__c ; i< (Integer)acc.Total_Contacts__c;i++){
                        Contact con = new Contact();
                        con.LastName = 'Test '+i;
                        con.AccountId = acc.Id;
                        conList.add(con);
                    }
                }else{
                    Integer c = ((Integer)newContacts*-1);
                    conDelList.addAll([Select id From Contact WHERE AccountId =: acc.id 
                                       ORDER BY CreatedDate DESC  limit : c]);
                    
                }
            }            
        }
        insert conList;
        delete conDelList;
        
    }
    
    
    /*   public static boolean handleAccount(List<Account> accList){

if(Trigger.isExecuting){
// do whatever you want to do as a part of the trigger incovation.
System.debug('Trigger is executing '+ Trigger.isExecuting);
}else{
// do whatever you want to do if the call is originated from different context.
System.debug('Without Trigger');
}
return Trigger.isExecuting;
}

public static void updateAccount(List<Account> accList, Map<Id,Account> accOldMap){

List<Account> aList = new List<Account>();
for(Account acc : accList){
Account a = new Account();
a.id = acc.Id;
a.Description = 'Account Recursion';
aList.add(a);
}
if(!aList.isEmpty()){
update aList;
}

}


public static void updateDesc(List<Account> accList){
if(!accList.isEmpty()){
for(Account acc : accList){
acc.Description = 'Account is created';
}
}
}

public static void populateRating(List<Account> accList){

for(Account acc : accList){
if(acc.Industry != null && acc.Industry == 'Media'){
acc.Rating = 'Hot';
}    
}
}

public static void createOpps(List<Account> accList){
List<Opportunity> oppList = new List<Opportunity>();
if(!accList.isEmpty()){
for(Account acc : accList){
Opportunity opp = new Opportunity();
opp.Name = 'Opp trg ';
opp.CloseDate = System.today();
opp.StageName = 'Closed Won';
opp.Amount=100000;
opp.AccountId=acc.Id;
oppList.add(opp);
} 
insert oppList;
/*Database.saveResult[] srList = Database.insert(oppList,false);
for(Integer i=0;i<srList.size();i++){
if(!srList[i].isSuccess()){
String errors ='';
for(Database.Error err : srList[i].getError()){
errors = errors + err.getMessage();
}
accList[i].addError(errors);
}
}
}

}


public static void createContact(List<Account> accList){
List<Contact> conList = new List<Contact>();
if(!accList.isEmpty()){
for(Account acc : accList){
for(Integer i=1; i<=5 ;i++){
Contact con = new Contact();
con.FirstName = 'Con trg ';
con.LastName =''+i; 
con.AccountId=acc.Id;
conList.add(con);
}
insert conList;
}
}
}


public static void createContactAndOppsConditionally(List<Account> accList){
List<Contact> conList = new List<Contact>();
List<Opportunity> oppList = new List<Opportunity>();
if(!accList.isEmpty()){
for(Account acc : accList){
if(acc.Contact__c == true){
Contact con = new Contact();
con.FirstName = 'Con trg ';
con.LastName ='Con 1'; 
con.AccountId=acc.Id;
conList.add(con);
}
}
insert conList;  

for(Account acc : accList){
if(acc.Opportunity__c == true && acc.Active__c == 'Yes'){
Opportunity opp = new Opportunity();
opp.Name = 'Opp trg Opp ';
opp.CloseDate = System.today();
opp.StageName = 'Closed Won';
opp.AccountId=acc.Id;
oppList.add(opp);
}
}
insert oppList;
}
}

public static void updatePhone(List<Account> accList, Map<Id,Account> accOldMap){
for(Account acc : accList){
if(acc.Phone != accOldMap.get(acc.id).Phone){
acc.Description = 'Phone is Updated, Old Value is '+accOldMap.get(acc.id).Phone+
' New Value is '+acc.Phone;
}
}
}

public static void populateRatingUpsert(List<Account> accList,Map<id,Account> accOldMap){

for(Account acc : accList){
if((accOldMap == null && acc.Industry != null && acc.Industry == 'Media')
|| (accOldMap != null && acc.Industry != accOldMap.get(acc.id).Industry && acc.Industry =='Media')){
acc.Rating = 'Hot';
}    
}
}


public static void updateRelatedContacts(List<Account> accList, Map<Id,Account> accOldMap){

List<Contact> conList = new List<Contact>();
Map<Id,Account> accMap = new  Map<Id,Account>();
for(Account acc : accList){
//Map will store those account whose phone get changed
if(acc.Phone != accOldMap.get(acc.Id).Phone){
accMap.put(acc.id,acc); 
} 
}      
for(Contact con : [SELECT id, Phone, AccountId FROM Contact WHERE AccountId IN: accMap.keySet()]){
con.Phone = accMap.get(con.AccountId).Phone;
conList.add(con);            
} 
if(!conList.isEmpty()){        
update conList;
} 
}

public static void updateRelatedContactsUsingSOQL(List<Account> accList, Map<Id,Account> accOldMap){

List<Contact> conList = new List<Contact>();
Set<Id> accIds = new  Set<Id>();
for(Account acc : accList){
//Map will store those account whose phone get changed
if(acc.Phone != accOldMap.get(acc.Id).Phone){
accIds.add(acc.id); 
} 
}      
for(Account acc : [SELECT id, Phone, (SELECT Phone FROM Contacts) FROM Account
WHERE id IN: accIds]){
if(acc.Contacts != null){
for(Contact con : acc.Contacts){
con.AccountId=acc.id;
con.Phone = acc.Phone;
conList.add(con);
}
}       
} 
if(!conList.isEmpty()){        
update conList;
} 
}

public static void preventDeleteActiveAccount(List<Account  > accList){
Profile p = [Select id From Profile Where Name= 'System Administrator'];
System.debug(p);
for(Account acc:accList){
if(acc.Active__c == 'Yes' || UserInfo.getProfileId() != p.id){
acc.addError(Label.Prevent_Account_Deletion);
}
}
}*/
}