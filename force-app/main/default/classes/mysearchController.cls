public class mysearchController {
    @AuraEnabled
    public static  List<Registration_Form__c> mysearch(String searchKeyWord) {
        String searchKey = '%' + searchKeyWord + '%';
        List < Registration_Form__c > returnLists = new List < Registration_Form__c > ();
        List < Registration_Form__c > stdlst = [select id, Student_Name__c, Parent_Name__c, Class_Name__c from Registration_Form__c where Student_Name__c LIKE: searchKey];
        for (Registration_Form__c RGS: stdlst) {
         returnLists.add(RGS);
  }
 		return returnLists;
    }   

//Method for update records inline editing
	@AuraEnabled
	public static List<Registration_Form__c> updateform(List<Registration_Form__c> lstform){
    	update lstform;
    	return lstform;
	}
}