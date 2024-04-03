public class SOQLDemo {
    
    public static void soqlParentToChild(){
        List<Account> accList = [SELECT Id, Name, (SELECT Id, FirstName, LastName FROM Contacts) FROM Account];
        for(Account acc : accList){
            System.debug('Account Name : '+ acc.Name);
            for(Contact con : acc.Contacts){
                System.debug('Contact Name : '+ con.FirstName +' '+con.LastName);
            }
        }
    }
    
    public static void soqlParentToChildOnCustomObject(){
        List<Class__c> classList = [SELECT Id, Name, Fees__c,
                               (SELECT Id, Name__c, Email__c,Passout__c,Phone_Number__c FROM Students__r) 
                               FROM Class__c];
        for(Class__c c : classList){
            System.debug('Class Name : '+ c.Name+' '+ c.Fees__c);
            for(Student__c s : c.Students__r){
                System.debug('Students Info : '+ s.Name__c +' '+s.Email__c+' '+ s.Phone_Number__c);
            }
        }
    }
    
    public static void soqlChildToParent(){
        List<Contact> conList = [SELECT Id, FirstName, LastName, Account.Name, Account.Type, Account.Active__c FROM Contact];
        for(Contact con : conList){
            System.debug('Contact Name : '+ con.FirstName+' '+con.LastName);     
            System.debug('Account Info : '+con.Account.Name);
        }
    }

   public static void soqlChildToParentCustom(){
        List<Student__c> sList = [SELECT Id, Name__c, Phone_Number__c,RecordTypeId,
                                     Class__r.Name, Class__r.Fees__c, Class__r.Course_Duration__c
                                     FROM Student__c];
        for(Student__c s : sList){
            System.debug('Student Info : '+ s.Name__c+' '+s.Phone_Number__c+' '+s.RecordTypeId);     
            System.debug('Class Info : '+s.Class__r.Name+' '+s.Class__r.Fees__c+' '+s.Class__r.Course_Duration__c);
        }
    }    
}