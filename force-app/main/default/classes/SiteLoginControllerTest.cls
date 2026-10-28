/**
 * An apex page controller that exposes the site login functionality
 */
@IsTest global with sharing class SiteLoginControllerTest {
    @IsTest(SeeAllData=true) global static void testSiteLoginController () {
        // Instantiate a new controller with all parameters in the page
        SiteLoginController controller = new SiteLoginController ();
        controller.username = 'test@salesforce.com';
        controller.password = '123456'; 
                
        System.assertEquals(controller.login(),null);                           
    }    
}
// update 2026-10-22T18:09:00.155Z

// update 2026-10-22T18:10:48.742Z

// update 2026-10-22T18:13:29.920Z

// update 2026-10-22T18:13:44.222Z

// update 2026-10-22T18:13:48.315Z

// update 2026-10-22T20:12:45.046Z

// update 2026-10-22T20:12:48.168Z
