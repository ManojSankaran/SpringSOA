public class ContactTriggerHelper{
    
    public static void CountContacts(string TriggerContext, List<contact> NewList, List<Contact> OldList, Map<id,contact> NewMap, Map<id,Contact> OldMap){
        Map<string,Integer> AccountContactMap = new Map<String,Integer>();
        Map<String,Integer> AccountContactUpdateMap = new Map<String,Integer>();
        if(TriggerContext == 'Insert' || TriggerContext == 'undelete'){
            for(Contact con : NewList){
                if(con.AccountId != Null){
                    Integer count = 0;
                    if(AccountContactMap.containsKey(con.AccountId)){
                        count = count + AccountContactMap.get(con.AccountId);
                    }
                    count = count + 1;
                    AccountContactMap.put(con.AccountId,count);
                }
            }
        }
        
        if(TriggerContext == 'update'){
            for(Contact con : NewList){
                if(con.AccountId != Null && con.AccountId != OldMap.get(con.id).AccountId){
                    Integer count = 0;
                    if(AccountContactMap.containsKey(con.AccountId)){
                        count = count + AccountContactMap.get(con.AccountId);
                    }
                    count = count + 1;
                    AccountContactMap.put(con.AccountId,count);
                    
                    
                    integer deleteCount = 0;
                    if(AccountContactUpdateMap.containsKey(OldMap.get(con.id).AccountId)){
                        deleteCount = deleteCount + AccountContactUpdateMap.get(OldMap.get(con.id).AccountId);
                    }
                    deleteCount = deleteCount + 1;
                    AccountContactUpdateMap.put(OldMap.get(con.id).AccountId,deleteCount);
                }
            }
        }
        
        
        if(TriggerContext == 'delete'){
            for(Contact con : oldList){
                if(con.AccountId != Null){
                    Integer count = 0;
                    if(AccountContactUpdateMap.containsKey(con.AccountId)){
                        count = count + AccountContactUpdateMap.get(con.AccountId);
                    }
                    count = count + 1;
                    AccountContactUpdateMap.put(con.AccountId,count);
                }
            }
        }
        
        List<Account> AccountList = new List<Account>();
        for(Account acc : [SELECT id,Contact_Count__c FROM Account WHERE id IN: AccountContactMap.keyset()]){
            if(acc.Contact_Count__c != Null)
                acc.Contact_Count__c = acc.Contact_Count__c + AccountContactMap.get(acc.id);
            else
                acc.Contact_Count__c =  AccountContactMap.get(acc.id);    
            AccountList.add(acc);
        }
        update AccountList;
        
        AccountList = new List<Account>();
        for(Account acc : [SELECT Contact_Count__c FROM Account WHERE id IN: AccountContactUpdateMap.keyset()]){
            acc.Contact_Count__c = acc.Contact_Count__c - AccountContactUpdateMap.get(acc.id);
            AccountList.add(acc);
        }
        update AccountList;
        
    }

}