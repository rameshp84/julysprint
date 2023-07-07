({

    
     
    
     doInit : function(component, event, helper) {       
     	var action = component.get("c.getAllAccounts");
     	action.setCallback(this, function(response){
     	component.set("v.myrows", response.getReturnValue());
     });
       $A.enqueueAction(action);
        //location.reload();
    }
})