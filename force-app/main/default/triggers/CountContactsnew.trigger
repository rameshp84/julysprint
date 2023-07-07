trigger CountContactsnew on Contact (after insert, after update, after delete, after undelete, before delete) {

    List<id> accIdList = new List<id>();
    if(Trigger.isInsert || Trigger.isUpdate || Trigger.isUndelete){
        For(Contact con1 : Trigger.new){
            accIdList.add(con1.accountid);
        }
    }
    
    if(Trigger.isDelete){
        For(Contact con1 : Trigger.old){
            accIdList.add(con1.accountid);
            con1.adderror('You Cannot Delete the Contact Record');
        }     
       
    }
    
    
    
    List<Account> accUpdateList = new List<Account>();
    For(Account acc : [SELECT No_Of_Contacts__c,(SELECT id FROM Contacts) FROM Account WHERE id =: accIdList]){
        acc.No_Of_Contacts__c = acc.Contacts.size();
        accUpdateList.add(acc);
    }
    try{
        update accUpdateList;
    }Catch(Exception e){
        System.debug('Exception :'+e.getMessage());
    }
}