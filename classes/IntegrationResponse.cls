public class IntegrationResponse{
    public cls_args args;
    public cls_headers headers;
    public String url;  
    class cls_args {
        public String foo1; 
        public String foo2; 
    }
    class cls_headers {
        public String host; 
        public String accept;   
        public String acceptencoding;  
        public String acceptlanguage;  
        public String referer;  
        public String upgradeinsecurerequests;    
        public String useragent;   
        public String xforwardedport; 
        public String xforwardedproto;
    }        
}