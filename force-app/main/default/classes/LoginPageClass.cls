public class LoginPageClass {
    @auraEnabled
    public static String getcontact(String username,String userpassw ){
        List<Contact> lcont=new List<Contact>([select Username__c,Password__c from Contact where Username__c=:username  Limit 1]);
            if(lcont.size()==0){
            	return 'User dose not exit!';
            }
            else{
            if(lcont[0].Password__c==userpassw ){
            	return 'Login successfully';
            }
            else{
            	return 'Invalid Password';
            }  
        }
    }

}