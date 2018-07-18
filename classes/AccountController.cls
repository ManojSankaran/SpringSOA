public class AccountController{

    @AuraEnabled
    public static List <Account> getAccounts() {
        return [SELECT Id, name, industry, Type, NumberOfEmployees, TickerSymbol, Phone FROM Account ORDER BY createdDate ASC LIMIT 10];
    }   
    
}