public with sharing class contactscontroller{
	
	@AuraEnabled
	public static List<Contact> serachcontacts(){		
		return[SELECT id, Lastname, phone from Contact];
	}
	
	@AuraEnabled
	public static List<contact> searchbyquery(String searchquery){
		String name = '%' + searchquery + '%';
		return[Select Id,name,phone from contact where name LIKE:name];
	}
}