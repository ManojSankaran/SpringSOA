/*************************************************************************************
** Project - Sprint SOA
**************************************************************************************
** Class Name : AccountController 
** Description: Apex Class which will be used by lightning component to get the latest
				Account details.
** Current Version: 1.0
**------------------------------------------------------------------------------------
**Modification Log: Added initial comments
**------------------------------------------------------------------------------------
**Developer                  Date              Version         Description
**------------------------------------------------------------------------------------
**Manoj Sankaran           18/07/2018            1.0             Created 

**************************************************************************************/
public class AccountController{

    @AuraEnabled
    public static List <Account> getAccounts() {
        return [SELECT Id, name, industry, Type, NumberOfEmployees, TickerSymbol, Phone FROM Account ORDER BY createdDate ASC LIMIT 10];
    }   
    
}