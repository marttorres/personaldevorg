public class StringArrayTest {
    public static List<String> generateStringArray(Integer intArraySize) {
        List<String> listResult = new List<String>();
        
        for(Integer i = 0 ; i < intArraySize ; i++) {
            listResult.add('Test ' + i);
        }
        
        return listResult; 
    }
}