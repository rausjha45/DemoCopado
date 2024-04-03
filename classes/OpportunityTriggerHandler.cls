public class OpportunityTriggerHandler {
    
    public static void validateAmount(List<Opportunity> oppList){
        for(Opportunity opp : oppList){
            if(opp.Amount == null ){
                opp.addError('Please populate amount');
            }
        }
    }

    public static void updateDesc(List<Opportunity> oppList,Map<Id, Opportunity> oppOldMap){
        List<Opportunity> oList = new List<Opportunity>();
        for(Opportunity opp : oppList){
            Opportunity op = new Opportunity();
            if(opp.StageName != oppOldMap.get(opp.id).StageName){
                if(opp.StageName =='Closed Won'){
                    op.Id = opp.Id;
                    op.Description = 'Opportunity is Closed Won';
                }else if(opp.StageName =='Closed Lost'){
                    op.Id = opp.Id;
                    op.Description = 'Opportunity is Closed Lost'; 
                }
            }   
            oList.add(op);
        }
        if(!oList.isEmpty()){
            update oList;
        }  
    }

    
    public static void populateOppsData(List<Opportunity> oppList){
        for(Opportunity opp : oppList){
            if(opp.Amount >100000 ){
                opp.Description = 'Hot Opportunity';
            }
        }
    }
    
    public static void populateAmountData(List<Opportunity> oppList){
        List<Account> accList = new List<Account>();
        for(Opportunity opp : oppList){
            if(opp.AccountId != null ){
                Account acc = new Account();
                acc.id = opp.AccountId;
                acc.Recent_Opportunity_Amount__c = opp.Amount;
                accList.add(acc);
            }
            if(!accList.isEmpty()){
                update accList;
            }
        }
    }
}