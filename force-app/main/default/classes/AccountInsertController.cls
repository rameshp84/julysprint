public class AccountInsertController {
    @AuraEnabled
    public static void insertaccount(Account acc){
         insert acc;
    }
}