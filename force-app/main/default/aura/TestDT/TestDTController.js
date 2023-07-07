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
    
    fetchAcc : function(component, event, helper) {
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
                component.set("v.myrows", response.getReturnValue());
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
        var data = component.get("v.myrows");
        var action = component.get("c.updateForm");
        action.setParams({lstForm : data});
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.myrows", response.getReturnValue());
                $A.get('e.force:refreshView').fire();
                alert('Updated Successfully...');                
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
        
    inlineEditName : function(component, event, helper) {
		// show the name edit field popup 
        component.set("v.nameEditMode", true); 
        // after the 100 millisecond set focus to input field   
        setTimeout(function(){ component.find("nameId").focus();}, 100);
	},
    
    inlineEditParent : function(component, event, helper) {
		// show the name edit field popup 
        component.set("v.parentEditMode", true); 
        // after the 100 millisecond set focus to input field   
        setTimeout(function(){ component.find("parentId").focus();}, 100);
	},
    
    inlineEditClass : function(component, event, helper) {
		// show the name edit field popup 
        component.set("v.classEditMode", true); 
        // after the 100 millisecond set focus to input field   
        setTimeout(function(){ component.find("classId").focus();}, 100);
	},
    
   inlineEditMobile : function(component, event, helper) {
		// show the name edit field popup 
        component.set("v.MobileEditMode", true); 
        // after the 100 millisecond set focus to input field   
        setTimeout(function(){ component.find("MobileId").focus();}, 100);
	},
    
    closeNameBox : function(component, event, helper) {
		// on focus out, close the input section by setting the 'nameEditMode' att. as false   
        component.set("v.nameEditMode", false); 
	},
    
    closeParentBox : function(component, event, helper) {
		// on focus out, close the input section by setting the 'parentEditMode' att. as false   
        component.set("v.parentEditMode", false);
	},
 
    closeClassBox : function(component, event, helper) {
		// on focus out, close the input section by setting the 'classEditMode' att. as false   
        component.set("v.classEditMode", false);
	},
    
 	closeMobileBox : function(component, event, helper) {
		// on focus out, close the input section by setting the 'mobileEditMode' att. as false   
        component.set("v.MobileEditMode", false);
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