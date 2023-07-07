public class AccountHandler {
    Public Static void Createcontact(List<Account> accountList){
        List<Contact> contactList = new List<Contact>();
        for(Account act:accountList){
            Contact cnt = new Contact();
            cnt.AccountId = act.Id;
            cnt.LastName = act.Name;
            contactList.add(cnt);
        }
        if(!contactList.isEmpty()){
            insert contactList;
        }
    }

}