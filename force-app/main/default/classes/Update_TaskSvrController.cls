public class Update_TaskSvrController {
	
    // method for inserting record into the Database    
    @AuraEnabled
    public static String saveDetails(Student_Registration_Form__c regForm1){
		// DML operation to save RegForm Details
		insert regForm1;
    	return regForm1.Name;
        
   	}
    
    // method to fecth the records from Database     
    @AuraEnabled
    public static List <Student_Registration_Form__c> fetchStudents() {
        //Qyery 10 accounts
        List<Student_Registration_Form__c> StdList = [SELECT Name, Parent_Name__c, Class_Name__c, Mobile_Number__c,State__c from Student_Registration_Form__c];
        //return list of accounts
        return StdList;
    }
    
    // method for searching the record    
    @AuraEnabled
    public static List<Student_Registration_Form__c> search(String key){
        String keyword = '%' + key + '%' ;
        List<Student_Registration_Form__c> rform = new List<Student_Registration_Form__c>();
        List<Student_Registration_Form__c> sr = [SELECT Name, Parent_Name__c, Class_Name__c,Mobile_Number__c
                                         FROM Student_Registration_Form__c WHERE Name LIKE:keyword];
        for (Student_Registration_Form__c r: sr) {
   			rform.add(r);
  		}
        return rform;
    }
    
    // method for update records after inline editing  
    @AuraEnabled
    public static List <Student_Registration_Form__c> updateForm(List<Student_Registration_Form__c> lstForm) {
        update lstForm;
        return lstForm;
    }
    
    // method to delete the record
    @AuraEnabled
    public static void deleteForm(List<Student_Registration_Form__c> lstId) {
      List <Student_Registration_Form__c> delstudent = [SELECT Id from Student_Registration_Form__c WHERE Id IN:lstId];
        delete delstudent;
    }
    
    @AuraEnabled
    public static String saveDetailspractose(Student_Registration_Form__c username1){
		// DML operation to save RegForm Details
		insert username1;
    	return username1.Name;
        
   	}
    
    @AuraEnabled
    public static List <Account> fetchAccounts() {
        //Qyery 10 accounts
        List<Account> AccList = [SELECT Name, Phone, Industry from Account];
        //return list of accounts
        return AccList;
    }
    
    @AuraEnabled
    public static List <Contact> fetchContacts(List<Id> accountIds) {
     List<Contact>  cntList = [Select id, Name, AccountId, Phone, Email from Contact WHERE AccountId in :accountIds];  
       return cntList;
    }
  
}