@isTest
public class OpportunityProcessorTest {

    public testMethod static void batchMethodTest(){
        List<Opportunity> oppList = new List<Opportunity>();
        for(Integer i=1;i<=100;i++){
            Opportunity opp = new Opportunity();
            opp.Name = 'Test batch '+i;
			opp.CloseDate = System.today()+10;
            opp.StageName = 'Media';
            opp.Amount = 23322;
            oppList.add(opp);
        }
        Test.startTest();
        insert oppList;
        OpportunityProcessor oppProcessor = new OpportunityProcessor();
		Id batchId = Database.executeBatch(oppProcessor,100);
        Test.stopTest();
        
        List<Opportunity> oList =[Select id, LeadSource From Opportunity Where LeadSource ='Web' ];
        System.assertEquals(100,oList.size(),'LeadSource is not updated Successfully');
    }
}