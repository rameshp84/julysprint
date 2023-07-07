public class math {
    public integer a{get;set;}
    public integer b{get;set;}
    public integer c{get;set;}
    public integer d{get;set;}
    public integer e{get;set;}
    public integer f{get;set;}
    public  void addition(){
        c = a + b;
        system.debug('addition of' +a+ '&' +b+ 'is' +c);
     //return c;
    }
     public void Subtraction(){
        d = a - b;
        system.debug('Subtraction of' +a+ '&' +b+ 'is' +d);
      //  return c;
    }
    public void Multiplication(){
        e = a * b;
        system.debug('Multiplication of' +a+ '&' +b+ 'is' +e);
      //  return c;
    }
    public void Division(){
        f = a / b;
        system.debug('Division of' +a+ '&' +b+ 'is' +f);
      //  return c;
    }
    public  void all(){
      c = a + b;
        d = a - b;
        e = a * b;
        f = a / b;
        system.debug('addition of' +a+ '&' +b+ 'is' +c);
     //return c;
    }
}