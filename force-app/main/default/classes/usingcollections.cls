public class usingcollections {
    //public integer a{get;set;}
    //public string name{get;set;}
    public collectiondata c1{get;set;}
	public list<collectiondata> col{get;set;}
    public boolean editview{get;set;}
    public boolean listview{get;set;}
    public usingcollections(){
        editview = false;
        listview = true;
        col = new list<collectiondata>();
        
               // listview = false;
              
    } 
       
    public  void add(){
        col.add(c1);         
        editview = false;
        listview = true;
    }    
    public  void new1(){
        
        c1 = new collectiondata(); 
        
        editview = true;
        listview = false;
	
       
    }
}