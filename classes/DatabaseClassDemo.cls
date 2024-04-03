public class DatabaseClassDemo {
    
    public static void insertContact(){
        List<Contact> conList = new List<Contact>{new Contact(FirstName='Joeg',LastName='Smithg',Department='Finance'),
            new Contact(FirstName='Roc',LastName='Keys',Department='Technology'),
            new Contact(FirstName='Ram',LastName='Lala',Department='Finance'),
            new Contact()};
                
                Database.saveResult[] srList= Database.insert(conList,false) ;
        
        for(Database.saveResult sr: srList){
            if(sr.isSuccess()){
                System.debug('Sucessfully inserted Contact. Contact Id: '+sr.getId());
            }else{
                //for(Database.Error err : sr.getError()){
                    System.debug('The Following error hsa occurred');
                 //   System.debug(err.getStatusCode() +' '+err.getMessage());
                   // System.debug('Contact Field that affect the error  : '+err.getFields());
                //}
            }
        }
    }
}