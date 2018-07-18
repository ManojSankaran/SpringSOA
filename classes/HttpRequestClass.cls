/*************************************************************************************
** Project - Sprint SOA
**************************************************************************************
** Class Name : HttpRequestClass 
** Description: Apex Class which will be used by to hit the sample url provided and will 
				parse the respone.
** Current Version: 1.0
**------------------------------------------------------------------------------------
**Modification Log: Added initial comments
**------------------------------------------------------------------------------------
**Developer                  Date              Version         Description
**------------------------------------------------------------------------------------
**Manoj Sankaran           18/07/2018            1.0             Created 

**************************************************************************************/
public class HttpRequestClass{

  
    public static String getCalloutResponse() {
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://postman-echo.com/get?foo1=bar1&foo2=bar2');//In Real time scenario this will be saved in custom setting and value we will get it from there.
        req.setMethod('GET');
        HttpResponse res = h.send(req);
        system.debug(res.getBody().replace('-',''));
        IntegrationResponse response = new IntegrationResponse();
        response = parse(res.getBody().replace('-',''));
        system.debug(response);    
        return res.getBody();
    }
  
    
    public static IntegrationResponse parse(String json){
        return (IntegrationResponse) System.JSON.deserialize(json, IntegrationResponse.class);
    }

}