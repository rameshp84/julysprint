public class TestClass {
	
    List<Student_Registration_Form__c> StdList1 = [SELECT Name, Parent_Name__c, Class_Name__c, Mobile_Number__c,State__c from Student_Registration_Form__c];          
    	Public List<Student_Registration_Form__c> getacts(){
    	return StdList1;
    }
}