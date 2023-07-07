Trigger UPDATE_INDUSTRY_CODES on Lead(before insert, before update){
    Map<Decimal, String> indCodeMap = new Map<Decimal, String>();
    List<Industry_Codes__c> indCodeList = [select code__c, Description__c from Industry_Codes__c];

    for(Industry_Codes__c indCode:indCodeList){
        indCodeMap.put(indCode.Code__c,indCode.Description__c);
    }
    
    for(Lead ld:Trigger.New){
        if(trigger.isInsert){
            if(ld.SIC_Code__c != null){
                ld.SIC_Code_Description__c=null;
                String[] sicArray = ld.SIC_Code__c.split(';');
                for(String res:sicArray){
                    if(ld.SIC_Code_Description__c !=null)
                        ld.SIC_Code_Description__c += indCodeMap.get(decimal.valueOf(res)) + ';';
                    else
                        ld.SIC_Code_Description__c = indCodeMap.get(decimal.valueOf(res)) + ';';
                    }
                }
            }
    else if(trigger.isUpdate){
        if(ld.SIC_Code__c != null && trigger.OldMap.get(ld.Id).SIC_Code__c != trigger.newMap.get(ld.Id).SIC_Code__c){
            ld.SIC_Code_Description__c=null;
            String[] sicArray = ld.SIC_Code__c.split(';');
            for(String res:sicArray){
                if(ld.SIC_Code_Description__c != null)
                    ld.SIC_Code_Description__c += indCodeMap.get(decimal.valueOf(res)) + ';';
                else
                    ld.SIC_Code_Description__c = indCodeMap.get(decimal.valueOf(res)) + ';';
                }   
            }
        }
    }

    for(Lead ld:Trigger.New){
        if(trigger.isInsert){
            if(ld.NAICS_Code__c != null){
                ld.NAICS_Code_Description__c=null;
                String[] sicArray = ld.NAICS_Code__c.split(';');
                for(String res:sicArray){
                    if(ld.NAICS_Code_Description__c !=null)
                        ld.NAICS_Code_Description__c += indCodeMap.get(decimal.valueOf(res)) + ';';
                    else
                        ld.NAICS_Code_Description__c = indCodeMap.get(decimal.valueOf(res)) + ';';
                    }
                }
            }
    else if(trigger.isUpdate){
        if(ld.NAICS_Code__c != null && trigger.OldMap.get(ld.Id).SIC_Code__c != trigger.newMap.get(ld.Id).NAICS_Code__c){
            ld.NAICS_Code_Description__c=null;
            String[] sicArray = ld.NAICS_Code__c.split(';');
            for(String res:sicArray){
                if(ld.NAICS_Code_Description__c != null)
                    ld.NAICS_Code_Description__c += indCodeMap.get(decimal.valueOf(res)) + ';';
                else
                    ld.NAICS_Code_Description__c = indCodeMap.get(decimal.valueOf(res)) + ';';
                }   
            }
        }
    }
    }