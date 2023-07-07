({
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
		// on focus out, close the input section by setting the 'parentEditMode' att. as false   
        component.set("v.classEditMode", false);
	},

    closeMobileBox : function(component, event, helper) {
		// on focus out, close the input section by setting the 'parentEditMode' att. as false   
        component.set("v.MobileEditMode", false);
	}
    
})