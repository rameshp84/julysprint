trigger AccToCon on Account (After Insert) {
    
    List<Contact> contactList = new List<Contact>();
    
    For(Account act:Trigger.new){
        Contact cnt = new Contact();
        cnt.AccountId = act.Id;
        cnt.LastName = act.Name;
        contactList.add(cnt);
     }
     
     if(!contactList.isEmpty()){
     insert contactList;
     
     }
     
    
}