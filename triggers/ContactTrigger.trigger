trigger ContactTrigger on Contact (after insert, after delete, after undelete, after update) {


    if(Trigger.IsAfter){
        if(Trigger.IsInsert || Trigger.IsUndelete){
            ContactTriggerHelper.CountContacts('insert',Trigger.New,null,null,null);
        }
        if(Trigger.IsUpdate){
            ContactTriggerHelper.CountContacts('update',Trigger.New,Trigger.Old,Trigger.NewMap,Trigger.OldMap);
        }
        if(Trigger.IsDelete){
            ContactTriggerHelper.CountContacts('delete',Trigger.New,Trigger.Old,Trigger.NewMap,Trigger.OldMap);
        }
        
    }
    
}