//trigger without Handler
trigger AccounttoContact on Account (after insert) {
    List<Contact> contactList = new List<Contact>();
    for(Account act:Trigger.new){
        Contact cnt = new Contact();
        cnt.AccountId = act.Id;
        cnt.LastName = act.Name;
        contactList.add(cnt);
    }
    if(!contactList.isEmpty()){
        insert contactList;
     }
}