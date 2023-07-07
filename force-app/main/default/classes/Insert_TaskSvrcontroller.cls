public class Insert_TaskSvrcontroller {
    @AuraEnabled
    public static String saveDetails(Student_Registration_Form__c regForm1){
		// DML operation to save RegForm Details
		insert regForm1;
    	return regForm1.Name;
        
   }
}