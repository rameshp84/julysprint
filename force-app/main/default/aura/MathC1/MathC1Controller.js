({
	addMethod : function(component, event, helper) {
		var sum = component.get("v.Num1") + component.get("v.Num2")
        component.set("v.Add",sum)
	},
    	subMethod : function(component, event, helper) {
		var sub = component.get("v.Num1") - component.get("v.Num2")
    	component.set("v.Sub",sub)
	},
    	mulMethod : function(component, event, helper) {
		var mul = component.get("v.Num1") * component.get("v.Num2")
        component.set("v.Mul",mul)
	},
    	divMethod : function(component, event, helper) {
		var div = component.get("v.Num1") / component.get("v.Num2")
        component.set("v.Div",div)
	}
})