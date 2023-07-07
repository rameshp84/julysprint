({
	init : function(component, event, helper) {
		component.set("v.mycolumns", [
            {label: "student name", fieldname: "Student_Name__c", type:"text"},
            {label: "parent name", fieldname: "Parent_Name__c", type:"text"},
            {label: "class name", fieldname: "Class_Name__c", type:"text"}
        ]);
	},
    dosearch : function(component, event, helper) {
        var searchkey = component.get("v.searchkeyword");
        var action = component.get("c.mysearch");
        if (searchkey == '' || searchkey == null){
            alert('please enter a keyword');
        }
        else {
            action.setParams({searchText: searchkey});
            action.setCallback(this, function(response){
                var state = response.getstate();
                if (state === 'SUCCESS') {
          			console.log(response.getReturnValue());
                    component.set("v.mydata", response.getReturnValue());
        		}
                else if (state ==="ERROR"){
                    var errors = response.getError();
            		if (errors){
                		if (errors[0] && errors[0].message){
                    		console.log("Error message" + errors[0].message);
                		}
                    }
      			}
            });
            }
    $A.enqueueAction(action);    
    }
    
})