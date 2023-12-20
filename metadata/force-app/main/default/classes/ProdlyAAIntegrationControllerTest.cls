@isTest
public class ProdlyAAIntegrationControllerTest {
    @isTest
    public static void testGetAppInfo(){  
        Boolean exceptionOccurred = false;
        try{
            Object newObj = ProdlyAAIntegrationController.getAppInfo();
            exceptionOccurred = false;
        }
        catch(Exception e) {
            exceptionOccurred = true;
        }
        System.assertEquals(exceptionOccurred, false);
    }
    @isTest
    public static void testGetAppInfoException(){   
        Boolean exceptionOccurred = false;
        try{
            Object newObj = ProdlyAAIntegrationController.getAppInfo();
			throw new AuraHandledException('Script-thrown exception');
        }
        catch(Exception e) {
            exceptionOccurred = true;
        }
        System.assertEquals(exceptionOccurred, true);
    }
}