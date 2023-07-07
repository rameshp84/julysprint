trigger Trigger_Admission on Admission__c (before insert,before update) {
List<Triggers__c> trig = new List<Triggers__c>();
Triggers__c s = new Triggers__c();
   
    for(Admission__c d : Trigger.new){
        s.Name = d.Student_Name__c;
        s.DOB__c = d.DOB__c;
        s.Gender__c = d.Gender__c;
            
        trig.add(s);        
    }
    insert trig;
}