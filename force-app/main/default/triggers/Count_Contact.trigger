trigger Count_Contact on Contact (after insert) {
    set<id> accid=new set<id>();

 list<contact> contactlist =new list<contact>();

 list<contact> listcon=new list<contact>();

 list<account> acclist=new list<account>();

 list<account> listAcc=new list<account>();

map<id,integer> mapCount=new map<id,integer>();

 if(trigger.isinsert){

 for(contact con:trigger.new){

 accid.add(con.accountid);

 }

 }

 if(trigger.isdelete){

 for(contact con:trigger.old){

 accid.add(con.accountid);

 }

 }

 acclist=[select id,name from account where id in:accid];

 contactlist = [select id,name,accountid from contact where accountid in:accid];

 for(account acc:acclist){

 listcon.clear();

 for(contact c:contactlist){

 if(c.accountid==acc.id){

 listcon.add(c);

 mapCount.put(c.accountid,listcon.size());

 }

 }

 }

 if(acclist.size()>0){

 for(Account a:acclist){

 if(mapCount.get(a.id)==null)

 a.No_Of_Contacts__c=0;

else

 a.No_Of_Contacts__c=mapCount.get(a.id);

 listAcc.add(a);

 }

 }

 if(listAcc.size()>0)

 update listAcc;

 }