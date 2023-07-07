public class RelationalSOQL_PTC {
    public list<Account> accs{set;get;}
    public boolean flag1{set;get;}
    public boolean flag2{set;get;}
    public void standardlookup(){
        flag1=true;
        flag2=false;
        accs = [SELECT Name,industry,(select lastname,firstname from contacts) from Account];
    }
}