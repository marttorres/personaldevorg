global class DependentPickListValueController {
    
global static List<SelectOption> getDependentSelectOptions(String objectType, String controllerName, String dependentFieldName, String parentValue) {
   List<SelectOption> dependentItems = new list<SelectOption>();
   if(null!=objectType && null!=controllerName && null!=dependentFieldName && null!=parentValue){
       Schema.DescribeFieldResult dependentField;
       Integer parentValueIndex = -1;
       
       //FIRST get the Parent PL's index value
       Schema.DescribeSObjectResult objectMeta = Schema.describeSObjects(new String[]{objectType})[0];
       Schema.SObjectField[] fields = objectMeta.fields.getMap().values();
       for (Schema.SObjectField f: fields) {
           Schema.DescribeFieldResult d = f.getDescribe();
           String fieldname = d.getName().toLowerCase();
           String ftype = String.valueOf(d.getType()).toLowerCase();
           if (fieldname.equals(controllerName.toLowerCase()) && ('picklist'.equals(ftype) || 'multipicklist'.equals(ftype))) {
               Schema.PicklistEntry[] pplvalues = d.getPicklistValues();
               for(Integer i=0; i<pplvalues.size(); i++) {
                   if(parentValue.equals(pplvalues[i].getValue())){
                       parentValueIndex = i;
                       break;
                   }
               }
           }
           if(fieldname.equals(dependentFieldName.toLowerCase()) && ('picklist'.equals(ftype) || 'multipicklist'.equals(ftype))) {
                dependentField = d;
           }
       }

       //2nd get the dependent PL values mapped to the target parent PL's value
       if(-1!=parentValueIndex && null!=dependentField ){
           Schema.PicklistEntry[] plValues = dependentField.getPicklistValues();
           for (PicklistEntry plv: plValues) {
               String jsonstr = JSON.serialize(plv);
               Map<String,String> jMap = (Map<String,String>) JSON.deserialize(jsonstr, Map<String,String>.class);
               String validFor = jMap.get('validFor');
               String plvalue = jMap.get('value');
               if(null!=validFor && !''.equals(validFor.trim()) && isDependentValue(parentValueIndex,validFor)){
                   dependentItems.add(new SelectOption(plvalue, plvalue));
               }
           }
       }
   }
   return dependentItems;
}

global static Boolean isDependentValue(Integer index, String validFor) { 
   String decoded = EncodingUtil.convertToHex(EncodingUtil.base64Decode(validFor));
   Integer bits = hexToInt(decoded);
   return ( ( bits & (128>>Math.mod(index,8)) ) != 0 );
}

private static Map<String,Integer> hexMap = new Map<String, Integer>{'0'=>0,'1'=>1,'2'=>2,'3'=>3,'4'=>4,'5'=>5,'6'=>6,'7'=>7,'8'=>8,'9'=>9,'A'=>10,'B'=>11,'C'=>12,'D'=>13,'E'=>14,'F'=>15,'a'=>10,'b'=>11,'c'=>12,'d'=>13,'e'=>14,'f'=>15};
global static Integer hexToInt(String hex) {
    Integer retVal = 0;
    for(Integer i=0;i<hex.length();i+=2) {
        retVal += (hexMap.get(hex.substring(i,i+1)) * 16) + (hexMap.get(hex.substring(i+1,i+2)));
    }
    return retVal;
}
}