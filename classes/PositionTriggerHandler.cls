public class PositionTriggerHandler {
    
    public static void populatePositionData(List<Position__c> pList){
        for(Position__c p : pList){
            if(p.Status__c =='New Position'){
                if(p.Open_Date__c == null){
                    p.Open_Date__c = System.today();
                } 
                if(p.Min_Pay__c == null){
                    p.Min_Pay__c = 100000;
                }
                if(p.Max_Pay__c ==null){   
                    p.Max_Pay__c = 150000;
                }
            }
        }
    }
    
    public static void createTask(List<Position__c> pList){
        
        List<Task> tList = new List<Task>();
        User u = [SELECT id FROM User WHERE Username='tuser012@gmail.com'];
        for(Position__c pos : pList){
            if(pos.Status__c =='New Position'){
                Task t = new Task();
                t.ActivityDate = System.today();
                t.WhatId = pos.id;
                t.Status='Not Started';
                t.Subject ='Test Trigger Case';
                t.OwnerId = u.Id;
                tList.add(t);
            }
            insert tList;
        }
    }

}