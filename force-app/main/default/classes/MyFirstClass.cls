public class MyFirstClass {
    public integer a{get;set;}
    public integer b{get;set;}
    public integer c{get;set;}
	public integer d{get;set;}
    public integer e{get;set;}
    public integer f{get;set;}
    public MyFirstClass(){
        a =10;
        b = 20;
        c = a+b;
        system.debug('addition of'+a+'and'+b+'is'+c);
    }
}