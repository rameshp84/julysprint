@RestResource(urlMapping='/ShowAdmissionDetails/*')
global class checkAccount{

    @Httpget
    global static List<Admission__c> getAccount(){
        List<Admission__c> lst;
        try{
            lst = [SELECT Student_Name__c, Gender__c from Admission__c];
            return lst;
        }
        catch(Exception ex)
        {
            system.debug('Error'+ex.getMessage());
        }
        return lst;
    
    }
    
}