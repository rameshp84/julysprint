({
	doInit : function(component,event){
	var act = component.get("c.serachcontacts");
	act.setCallback(this,function(a){
		component.set("v.Contacts",a.getReturnValue());
	});
		$A.enqueueAction(act);  
	}
})