({
    fetchAccHelper : function(component, event, helper) {
        component.set('v.mycolumns', [
            	{label: 'Student Name', fieldName: 'Name', type: 'text'},
                {label: 'Parent Name', fieldName: 'Parent_Name__c', type: 'text'},
                {label: 'Class Name', fieldName: 'Class_Name__c', type: 'text'},
            	{label: 'Mobile Number', fieldName: 'Mobile_Number__c', type: 'Phone'},
            	{label: 'State', fieldName: 'State__c', type: 'Picklist'}
            
            ]);
        var action = component.get("c.fetchStudents");
        action.setParams({
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.myrows", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
        //location.reload();
    }
})