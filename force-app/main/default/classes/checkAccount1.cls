@RestResource(urlMapping='/MyDummyAccountDetails/*')
global class checkAccount1{

    @Httpget
    global static Account doGet(){
        RestResponse res = RestContext.response;
        RestRequest req = RestContext.request;
        string AccountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        system.debug('Account Id:'+AccountId);
        Account result = [SELECT Id,name,phone,AccountNumber from Account where Id=:AccountId];
        return result;
    }
    
    @HttpPost
    global static string dopost(String name, string Phone, String AccountNumber){
        Account acc = new Account();
        acc.Name = name;
        acc.Phone = phone;
        acc.AccountNumber = AccountNumber;
        insert acc;
        return acc.Id;
        
    }
    
    @HttpDelete
    global static void doDelete(){
        RestResponse res = RestContext.response;
        RestRequest req = RestContext.request;
        string AccNumber = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account result = [SELECT Id,name,phone,AccountNumber from Account where AccountNumber =:AccNumber];
        delete result;
    }
    
    
}