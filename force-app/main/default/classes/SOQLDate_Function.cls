public class SOQLDate_Function {
    public list<opportunity> opps{set;get;}
    public SOQLDate_Function(){
        opps=[select name,Amount,Stagename,closedate,createddate from opportunity];
    }
    public void closedtoday(){
        opps=[select name,Amount,Stagename,closedate,createddate from opportunity where closedate=TODAY];
    }
    public void closedthisweek(){
        opps=[select name,Amount,Stagename,closedate,createddate from opportunity where closedate=THIS_WEEk];
    }
    public void closedthisMon(){
        opps=[select name,Amount,Stagename,closedate,createddate from opportunity where closedate=THIS_MONTH];
    }
    public void closedthisYr(){
        opps=[select name,Amount,Stagename,closedate,createddate from opportunity where closedate=THIS_YEAR];
    }
    public void closedlastYr(){
        opps=[select name,Amount,Stagename,closedate,createddate from opportunity where closedate=LAST_YEAR];
    }
    public void closedlastNYr(){
        opps=[select name,Amount,Stagename,closedate,createddate from opportunity where closedate=LAST_N_YEARS:2];
    }
}