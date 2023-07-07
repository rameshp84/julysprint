public class AccountControllerSurya {
    @AuraEnabled
public static List <Account>fetchAccounts() {
        //Qyery 10 accounts
        List<Account>accList = [SELECT Id, Name, BillingState, 
                                    Website, Phone, Industry, Type from Account ];
        //return list of accounts
return accList;
    }
}