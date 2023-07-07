trigger AdmissionTrigger on Admission__c (before insert, before update) {
    for(Admission__c adm:trigger.new) {
        if(adm.Student_Name__c==null ) {
            adm.Student_Name__c.addError('This Name is a required field.');
        }
    }
}