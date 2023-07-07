({
	Calculate : function(component, event, helper) {
		var sum = component.get("v.Num1") + component.get("v.Num2")
        component.set("v.Add",sum)
        var sub = component.get("v.Num1") - component.get("v.Num2")
    	component.set("v.Sub",sub)
        var mul = component.get("v.Num1") * component.get("v.Num2")
        component.set("v.Mul",mul)
        var div = component.get("v.Num1") / component.get("v.Num2")
        component.set("v.Div",div)
	}
})