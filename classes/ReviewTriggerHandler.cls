public class ReviewTriggerHandler {

    public static void checkRatingPopulated(List<Review__c> revList){
        List<Job_Application__c> jobList = new List<Job_Application__c>();
        for(Review__c rev: revList){
            if(rev.Rating__c != null){
                Job_Application__c jobs = new Job_Application__c();
                jobs.Review_Provided__c ='Yes';
                jobs.Id= rev.Job_Application__c;
                jobList.add(jobs);
            }
        }
        update jobList;
    }
}