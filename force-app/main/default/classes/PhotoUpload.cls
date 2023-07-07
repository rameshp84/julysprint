public class PhotoUpload {
//public class ContactPhotoExtension { 

public Employee__c cont;
public blob picture {get;set;}

 public PhotoUpload(ApexPages.StandardController st){
  this.cont = (Employee__c) st.getRecord();
 
 }
 public PageReference save() {
 PageReference pr ;
  try{
     insert cont;
     if(picture !=null) {
      Attachment attach = new Attachment();
        attach.body = picture;
        attach.name = 'Employee_' + cont.id + '.jpg';
        attach.parentid = cont.id;
        attach.ContentType = 'application/jpg';
        insert attach;
     cont.Image_Upload__c = '/servlet/servlet.FileDownload?file='+ attach.id;
                update cont;
       Pr = new PageReference('/'+cont.id);
       pr.setRedirect(true);
    }
   
  
  } catch(Exception  e){
   system.debug('Error Message==>'+e);
  }
 
  return pr;
 } 


}