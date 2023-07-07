public class FetchRelatedListAccount {
    public List<Account> accs{set;get;}
    public FetchRelatedListAccount(){
    	accs = [Select Name, id, (select lastname,firstname from contacts) from account];
    }
}