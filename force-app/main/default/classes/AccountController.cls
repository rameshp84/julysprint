public with sharing class AccountController {
    @AuraEnabled
    public static List<Account> findAll() {
    return [SELECT id, name, Location__Latitude__s, Location__Longitude__s
            FROM Account
            WHERE Location__Latitude__s != NULL AND Location__Longitude__s != NULL
            LIMIT 50];
    }
    Public static void main(List<Account> accList)
    {
        List <Account> acc = [SELECT id, name, Location__Latitude__s, Location__Longitude__s
        FROM Account
        WHERE Id in : accList LIMIT 50];
        system.debug(acc);
    }
}