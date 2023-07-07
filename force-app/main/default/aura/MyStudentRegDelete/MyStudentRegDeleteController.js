({
    init : function(component, event, helper) {
        component.set('v.mycolumns', [
            	{label: 'Student Name', fieldName: 'Name', type: 'text'},
                {label: 'Parent Name', fieldName: 'Parent_Name__c', type: 'text'},
                {label: 'Class Name', fieldName: 'Class_Name__c', type: 'text'}         
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
    },
    
     handleRowAction : function(component, event, helper){
        var selRows = event.getParam('selectedRows');
        component.set("v.delIds",selRows);
    },
	
    doDelete : function(component, event, helper){
        var delIdList = component.get("v.delIds");
        var action = component.get('c.deleteForm');
        action.setParams({lstId : delIdList});
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {                
                $A.get('e.force:refreshView').fire();
                alert('Successfully Deleted');  
                
            }
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + 
                                    errors[0].message);
                    }
                } 
                else {
                    console.log("Unknown Error");
                }
            }
        });
        $A.enqueueAction(action);
    }
})