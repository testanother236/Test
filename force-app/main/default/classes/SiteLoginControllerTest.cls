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
// update 2026-10-22T18:12:09.697Z

// update 2026-10-22T18:12:56.787Z

// update 2026-10-22T18:14:37.899Z

// update 2026-10-22T20:11:31.902Z

// update 2026-10-22T20:11:44.426Z
