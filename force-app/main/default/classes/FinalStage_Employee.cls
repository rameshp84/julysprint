public class FinalStage_Employee {
    public Employee__c e{get;set;}
    public list<Employee__c> emp{get;set;}
    public Employee__c emp1{get;set;}
    
    public list<wrapaccount> wrapaccountList { get; set; }
    public list<Employee__c> selectedAccounts{get;set;}    
    
    public boolean bl1{get;set;}//List View
    public boolean bl2{get;set;}//Edit View
    public boolean bl3{get;set;}//Detailed View
    public boolean x{get;set;}
    public boolean y{get;set;}
    public boolean z{get;set;}
    
    public Employee__c cont;
	public blob picture {get;set;}
    
    public String sendemail{get;set;}
    public String empid{get;set;}
    public String paramString{get;set;}
    
    //to retrieve the data from the database
    public FinalStage_Employee(){
        emp=new List<Employee__c>();
        emp=[Select Id,name,Last_Name__c,Designation__c,DOB__c,DOJ__c,Qualifications__c,Mobile__c,Email_ID__c,Age__c,Experience_in_Years__c,Salary__c,Picture__c from Employee__c];
        
        bl1 = true;
        bl2 = false;
        bl3 = false;
    }
    
    //method for creating a new record
    public void new_emp(){
        
        e = new Employee__c();//instance to create the new record
        bl1 = false;
        bl2 = true;
        bl3 = false;        
    }
    
    //method for saving the record with validation for email
    public void save_emp(){
	PageReference pr ;
        
        //To Calculate the Age in Years based on DOB
        integer age1 = e.DOB__c.daysBetween(date.today());
        e.Age__c = age1/365;
        
        //To Calculate the Experience in Years based on DOJ
        integer exp1 = e.DOJ__c.daysBetween(date.today());
        e.Experience_in_Years__c = exp1/365;
        
        //To Calculate the Salary based on Experience
         if(e.Experience_in_Years__c <= 1 && e.Experience_in_Years__c < 2){
            e.Salary__c = 15000;
        }
            else if(e.Experience_in_Years__c >= 2 && e.Experience_in_Years__c <= 3){
            	e.Salary__c = 20000;    
            }
			 else if(e.Experience_in_Years__c >= 4 && e.Experience_in_Years__c <= 5){
            	e.Salary__c = 25000;    
            }          
        else {
            	e.Salary__c = 50000;    
        }
                
        //Email ID Validation
        for(Employee__c email:[Select Id,Email_ID__c From Employee__c]){
            if(e.Email_ID__c == email.Email_ID__c && e.Email_ID__c != null){
                x = true;
            }
        }
        if(x == true){
            ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.ERROR,'The entered Email ID is already exists in the Data Base');
            ApexPages.addMessage(msg);
        }
    	else{
        	upsert e;
            bl1 = false;
            bl2 = false;
            bl3 = true; 
    	}	
        x = false;
       try{
         insert cont;
         if(picture !=null) {
          Attachment attach = new Attachment();
            attach.body = picture;
            attach.name = 'Employee_' + cont.id + '.jpg';
            attach.parentid = cont.id;
            attach.ContentType = 'application/jpg';
            insert attach;
         	cont.Image_Upload__c = '/servlet/servlet.FileDownload?file='+ attach.id;
            update cont;
           	Pr = new PageReference('/'+cont.id);
            pr.setRedirect(true);
        	} 
      	} 
        	catch(Exception  e){
        	system.debug('Error Message==>'+e);
      	}
      	//	return pr;
 
		}
    
    //method for creating save and new record
    public void save_newemp(){
        e = new Employee__c();//instance to create the new record
        for(Employee__c eemail:[Select Id,Email_ID__c From Employee__c]){
            if(e.Email_ID__c == eemail.Email_ID__c && e.Email_ID__c != null){
                x = true;
            }
        }
        if(x == true){
            ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.ERROR,'The entered Email ID is already exists in the Data Base');
            ApexPages.addMessage(msg);
        }
    	else{
        	upsert e;
            bl1 = false;
            bl2 = false;
            bl3 = true; 
    	}	
        x = false;	
        
    }
    //method to cancel the record
    public void cancelemp(){
        
        bl1=true;
        bl2=false;
        bl3=false;
    }
    //method to edit the record
    public void editemp(){
        
        bl1=false;
        bl2=true;
        bl3=false;
        
    }
    //method to del the record
    public void delemp(){
        
        delete e;
        
        bl1=true;
        bl2=false;
        bl3=false;        
    }
    //method for back button
    public void backemp(){
            
        emp=new List<Employee__c>();
        emp=[Select Id,name,Last_Name__c,Designation__c,DOB__c,DOJ__c,Qualifications__c,Mobile__c,Email_ID__c,Age__c,Experience_in_Years__c,Salary__c,Picture__c from Employee__c];
              
        bl1=true;
        bl2=false;
        bl3=false;
    }
    public void clemp(){
        
       //emp=[Select Id,Name,Last_Name__c,email__c,phoneno__c,experience__c,salery__c From Employee__c Where Id =: ApexPages.currentPage().getParameters().get('e.Id')];
              
       empid = ApexPages.CurrentPage().getParameters().get('paramString');
             system.debug(empid);

       //paramString= ApexPages.CurrentPage().getParameters().get('empid');
        emp1 = [Select Id,Name,Last_Name__c,Email_ID__c,Mobile__c,Age__c,Experience_in_Years__c,Salary__c,Picture__c From Employee__c Where Id =: empid];
       
        bl1=false;
        bl2=false;
        bl3=true;
    }

 public PageReference gotorecordview() {
    
        
        PageReference pageRef = new PageReference('https://ap5.salesforce.com/apex/employee_sobject');
       
        pageRef.getParameters().put('id',paramString);
        pageRef.setRedirect(true);    
        return pageRef ;
    }
   // Create an email message object
   public void sendMail(string address, String subject, String body) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        //sendemail = [Select ID,Email_ID__c from Employee__C] ;
       	String[] toAddresses = new String[] {address};
        mail.setToAddresses(toAddresses);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        // Pass this email message to the built-in sendEmail method 
        // of the Messaging class
        Messaging.SendEmailResult[] results = Messaging.sendEmail(
        new Messaging.SingleEmailMessage[] { mail });     
        // Call a helper method to inspect the returned results
        inspectResults(results);
   }  
    // Helper method
    private static Boolean inspectResults(Messaging.SendEmailResult[] results) {
        Boolean sendResult = true;      
        // sendEmail returns an array of result objects.
        // Iterate through the list to inspect results. 
        // In this class, the methods send only one email, 
        // so we should have only one result.
        for (Messaging.SendEmailResult res : results) {
            if (res.isSuccess()) {
                System.debug('Email sent successfully');
            }
            else {
               sendResult = false;
               System.debug('The following errors occurred: ' + res.getErrors());                 
            }
        }
        return sendResult;
    }
     public void WrapClass (){
      
     //if(wrapaccountList ==null){
          wrapaccountList =new list<wrapaccount>();
          for(Employee__c a:[select id,name from Employee__c limit 10]){
           wrapaccountlist.add(new wrapaccount(a));
        
           }
        // }
      }

    //### SELECTED ACCOUNT SHOWN BY THIS METHOD
      public void ProcessSelected(){
     selectedAccounts=new list<Employee__c>();
     
      for(wrapaccount wrapobj:wrapaccountlist){
           if(wrapobj.isSelected==true){
           selectedAccounts.add(wrapobj.wrap1);
           }
            
         }
      }
      
  //##THIS IS WRAPPER CLASS
   // account and checkbox taken in wrapper class
   
   public class wrapaccount{
    
    public Employee__c wrap1{get;set;}
    public boolean isSelected{get;set;}
     
       public wrapaccount(Employee__c a){
     
         wrap1=a;
         isselected=false;
       }
  }
}