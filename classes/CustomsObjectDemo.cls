public class CustomsObjectDemo {
    public static void insertPosition(){
        Position__c pos = new Position__c();
        pos.Open_Date__c = System.today()-10;
        pos.Name = 'Systems Engineer';
        pos.Apex__c = true;
        pos.Working_Days__c = 'Monday';
        pos.Close_Date__c = System.today()+10;
        pos.Functional_Area__c = 'Information Technology';
        pos.Educational_Requirement__c= 'Btech';
        insert pos;
     
        Candidate__c c = new Candidate__c();
        c.First_Name__c ='Candidate ';
        c.Last_Name__c ='108';
        c.City__c = 'Bangalore';
        c.Country__c ='India';
        c.Phone__c ='7483';
        c.Email__c ='anv@gmakll.com';
        c.Education__c = 'HS Diploma';
        insert c;
        
        Job_Application__c job = new Job_Application__c();
        job.Status__c ='New';
        job.Candidate__c = c.Id;
        job.Position__c =pos.Id;
        insert job;
        
        Review__c r = new Review__c();
        r.Job_Application__c = job.Id;
        r.Rating__c = 4.0;
        insert r;
    }

}