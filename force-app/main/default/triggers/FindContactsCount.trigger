trigger FindContactsCount on Contact (after insert, after update, after delete) {

   List<Contact> modContacts = Trigger.isDelete ? Trigger.old:Trigger.new;

    Set<Id> accIds = new Set<Id>();

    for (Contact c: modContacts)  {

        accIds.add(c.AccountId);

    }

   List<Account> modAccounts = [Select Name, (Select Id from Contacts)  from Account WHERE Id in: accIds ];

 

    for (Account a: modAccounts) {

       List<Contact> s = a.Contacts;

       System.debug('Account:' + a.Name + ' No. of Contacts: '+ s.size());

       a.No_of_Contacts__c = s.size();

    }

}