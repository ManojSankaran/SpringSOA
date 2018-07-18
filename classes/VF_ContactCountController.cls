/*************************************************************************************
** Project - Sprint SOA
**************************************************************************************
** Class Name : VF_ContactCountController 
** Description: Apex Class which will be used as extension for
                VF_ContactCount Visualforce Page.
** Current Version: 1.0
**------------------------------------------------------------------------------------
**Modification Log: Added initial comments
**------------------------------------------------------------------------------------
**Developer                  Date              Version         Description
**------------------------------------------------------------------------------------
**Manoj Sankaran           18/07/2018            1.0             Created 

**************************************************************************************/
public class VF_ContactCountController {
    public Integer ContactCount {get;set;}

    public VF_ContactCountController(ApexPages.StandardController controller) {
        Account acc = new Account();
        acc = (Account)controller.getRecord();
        ContactCount = [SELECT Count() FROM Contact WHERE AccountId =: acc.id];
    }

}