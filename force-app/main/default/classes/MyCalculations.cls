public class MyCalculations {
	public integer x=20;
    public integer y=30;
    public integer z;
    public integer d;
    public integer e;
    public integer f;
    public void myCal(){
        z=x+y;
        d=y-x;
        e=x*y;
        f=y/x;
        system.debug('The Value of Z(Add) is'+z);
        system.debug('The Value of D(sub) is'+d);
        system.debug('The Value of e(Mul) is'+e);
        system.debug('The Value of f(Div) is'+f);
    }
}