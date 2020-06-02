public with sharing class TestExtension {
    public String text {get; set;}
    
    public TestExtension(ApexPages.StandardController controller) {
        text = 'Testing text';
    }
}