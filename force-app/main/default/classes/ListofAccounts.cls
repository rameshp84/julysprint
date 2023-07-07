Public Class ListofAccounts{

    List<Account> acts = [SELECT Name, Type, Industry, Phone, FAX from Account];
    
    Public List<Account> getacts(){
    return acts;
    }
    
   }