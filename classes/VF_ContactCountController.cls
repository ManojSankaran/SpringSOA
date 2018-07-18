public class VF_ContactCountController {
    public Integer ContactCount {get;set;}

    public VF_ContactCountController(ApexPages.StandardController controller) {
        Account acc = new Account();
        acc = (Account)controller.getRecord();
        ContactCount = [SELECT Count() FROM Contact WHERE AccountId =: acc.id];
    }

}