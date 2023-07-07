public class BulkEmails {
	public void SendEmail(){
    	//String subject = 'Testing Mass email demo';
        //String body = 'This is testing for Send mass emails from your apex class in Salesforce';       
        // Create a master list to store the emails that we will send
        List<Messaging.SingleEmailMessage> masterListMails = new List<Messaging.SingleEmailMessage>();
        for (Contact myContact : [SELECT ID, Email FROM Contact where Email!= null and LastModifiedDate = today]){
        	// Define the email
          	Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage(); 

           // Set list of peoples who should recieve an email
           List<string> sendTo = new List<string>();
           sendTo.add(myContact.Email);
           email.setToAddresses(sendTo);
           email.setSenderDisplayName('Official Nitish Account');
           // Sets the paramaters of the email
           //email.setSubject( subject );
           //email.setPlainTextBody( body );
           email.setSubject('Testing Mass email demo');
           email.setPlainTextBody('This is testing for Send mass emails from your apex class in Salesforce');
           // Add your email address into the master list
           masterListMails.add(email);
     }
       // Sends mass emails
       Messaging.sendEmail(masterListMails);
      }
}