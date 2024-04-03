public with sharing class ContactController {

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContact(){
        return [SELECT Id, FirstName, LastName, Email, Phone
               FROM Contact LIMIT 10 ];
    }
}