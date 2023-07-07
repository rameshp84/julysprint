public with sharing class AddImagetoContact {
    
    public Attachment att{get;set;}
    private Id parentID{get;set;}
    public AddImagetoContact(ApexPages.StandardController controller)
    {
        att=new Attachment();
        parentID=controller.getId();        
    }
    
    public void UploadImage(){
        att.parentID=parentId;
        att.Name='image';
        insert att;
        att=new Attachment();
    }
    
    public Id getImageId(){
        
        Id result=null;
        List<Attachment> images=[select id from Attachment where Name='image' and parentId=:parentId order by CreatedDate DESC];
        if(images.size()>0)
        {
            result=images[0].id;            
        }
        return result;
    }

}