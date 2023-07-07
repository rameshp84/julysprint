({
	doSubmit : function(component, event, helper) {
		var regForm = component.get("v.RegForm");
        //component can access server method but cannot call
        //client controller can call server method
        var action = component.get("c.saveDetails");
        //setParams-->set parameters of server controller in JSON format
        action.setParams({regForm1 :regForm});
         //setCallback--> fetch response from server controller
        //below response is a variable which we can take our on own.
        action.setCallback(this, function(response){
                           
        	var state = response.getState();
        	
        if(state === "SUCCESS"){
            //Returns the list of records from server controller
            var values = response.getReturnValue();
            alert('Successfully Saved');
        }
        	else if (State === "ERROR"){
            	var errors = response.getError();
                if(errors){
                    if(errors[0] && errors[0].message){
                        console.log("Error Message: "+ errors[0].message);
                }
        }
                else{
                    console.log();
                }
            }
           });
 			$A.enqueueAction(action);
}
})