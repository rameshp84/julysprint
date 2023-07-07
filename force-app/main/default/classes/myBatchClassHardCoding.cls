public class myBatchClassHardCoding implements database.Batchable<SObject>{
    public Database.QueryLocator start(Database.BatchableContext bc){
        string Query = 'Select name,industry from Account';
        return database.getQueryLocator(query);
    }
    public void execute(database.BatchableContext bc, List<Account> scope){
        List<Account> accs = new List<Account>();
        for(Account a: scope){
            a.industry = 'Government';
            a.Rating = 'Cold';
            accs.add(a);
        }update accs;
    }
    public void finish(database.BatchableContext bc){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        //string[] ToAdd = new string[]('rameshpallerla244@gmail.com');
        mail.setToAddresses(new String[] {'rameshpallerla244@gmail.com'});
        mail.setSubject('myBatchClassHardCoding is completed successfully');
        mail.setPlainTextBody('The Mentioned Batch class is completed successfully');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
    }
}