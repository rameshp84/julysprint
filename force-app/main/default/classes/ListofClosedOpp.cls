Public class ListofClosedOpp{

List<Opportunity> opps = [SELECT Id,StageName From Opportunity WHERE StageName = 'Closed Won'];

Public List<Opportunity> getOpps(){
return opps;
}
}