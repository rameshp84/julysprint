public class AddAccountController {
public List <Account> account=new List <Account>();
    public Account act{get;set;}
    public AddAccountController() {      
        act = new Account();
    }
    public List <Account> getAccount() {
        account = [SELECT Id, Name, Site, Type, AccountNumber FROM Account order by createddate desc limit 20];
        return account;
    }
    public PageReference cancel() {
        return null;
    }
    public PageReference save() {
        system.debug('act name:' + act.name + ' = ' + act.accountNumber);
        upsert act;
        return null;
    }
}