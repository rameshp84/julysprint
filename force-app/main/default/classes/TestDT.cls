public class TestDT {

	@AuraEnabled
    public static List <Student_Registration_Form__c> fetchStudents() {
        //Qyery 10 accounts
        List<Student_Registration_Form__c> StdList = [SELECT Name, Parent_Name__c, Class_Name__c, Mobile_Number__c from Student_Registration_Form__c];
        //return list of accounts
        return StdList;
    }
    
    @AuraEnabled
    public static void updatetstd(List<Student_Registration_Form__c> std ){
        update std;
    }
}