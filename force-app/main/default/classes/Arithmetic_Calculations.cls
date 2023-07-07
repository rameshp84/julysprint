public class Arithmetic_Calculations {
    public integer XValue{set;get;}
    public integer YValue{set;get;}
    public integer Add{set;get;}
    public integer Sub{set;get;}
    public integer Mul{set;get;}
    public integer Div{set;get;}
    public string Operations{set;get;}
    public void myAdd(){
        Add = XValue+YValue;        
    }
    public void mySub(){
        Sub = XValue-YValue;        
    }
    public void myMul(){
        Mul = XValue*YValue;        
    }
    public void myDiv(){
        Div = XValue/YValue;        
    }
    public void calculate(){
        Add = XValue+YValue;        
        Sub = XValue-YValue;
        Mul = XValue*YValue;
        Div = XValue/YValue;
    }
}