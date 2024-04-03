public class UpdateParentAccount implements Queueable {
    
    private List<Account> accList;
    private id parentId;
    
    public UpdateParentAccount(List<Account> accList,id pid){
        this.accList=accList;
        this.parentId = pid;
    }
    
    public void execute(QueueableContext qc){
        if(!accList.isEmpty()){
            for(Account acc : accList){
                acc.ParentId = parentId;
            }
            update accList;
        }
        
    }
}