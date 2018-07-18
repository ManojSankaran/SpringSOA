({
    doInit: function(component, event, helper) {
        // Fetch the account list from the Apex controller
        helper.getAccountList(component);
    },
	viewRecord : function(component, event, helper) {
         var navEvent = $A.get("e.force:navigateToSObject");
         var idx = event.target.getAttribute('data-index');         
         var account = component.get("v.accounts")[idx];        
         if(navEvent){
             navEvent.setParams({
                  recordId: account.Id,
                  slideDevName: "detail"
             });
             navEvent.fire(); 
         }

    },
    navigateToRecord : function(component, event, helper) {
        var recordId = event.getParam("recordId");
        window.location.href = '/one/one.app#/sObject/'+recordId+'/view';
    },    
})