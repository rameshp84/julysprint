({
	helperMethod : function() {
		
	}
})
/*({
    
	doSearch : function(component, event, helper) {
        var src = component.get("v.SearchKeyword");
        var action = component.get("c.search");
        if (src == '' || src == null) {
            // display error message if input value is blank or null
            alert('Enter search keyword');
        }
        action.setParams({key : src});
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log(response.getReturnValue());
                component.set("v.mydata", response.getReturnValue());
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
	},
    
    doAllUpdate : function(component, event, helper){
        var data = component.get("v.mydata");
        var action = component.get("c.updateForm");
        action.setParams({lstForm : data});
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.mydata", response.getReturnValue());
                alert('Updated Successfully...');
                location.reload();
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
    },
    

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
})*/