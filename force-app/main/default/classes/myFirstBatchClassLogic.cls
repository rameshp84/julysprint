public class myFirstBatchClassLogic implements database.Batchable<SObject>{
    string Query;
    string field;
    string value;
    public myFirstBatchClassLogic(string q, string f, string v){
        Query = q;
        field = f;
        value = v;
    }
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext bc, List<SObject> scope){
        for(SOBject a: scope){
            a.put(field,value);
        }update scope;
    }
    public void finish(Database.BatchableContext bc){
        
    }

}