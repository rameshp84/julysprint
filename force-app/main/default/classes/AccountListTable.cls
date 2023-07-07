public class AccountListTable {
@auraEnabled
public static list<account> getAllAccounts()
    {
        List<Account> accs = [Select id,Name,Phone,Industry, (Select id,LastName from Contacts) from Account];
       //list<account> accs =[select id,name,phone,industry,(select lastName from contacts) from account limit 10];
      //  list<account> accs =[select id,name,phone,industry from account limit 10];
     //   return [select Id,Name from account limit 10];
     return accs;
    }
    
     @AuraEnabled
    public static List <Student_Registration_Form__c> fetchStudents() {
        //Qyery 10 accounts
        List<Student_Registration_Form__c> StdList = [SELECT Name, Parent_Name__c, Class_Name__c, Mobile_Number__c,State__c from Student_Registration_Form__c];
        //return list of accounts
        return StdList;
    }
}