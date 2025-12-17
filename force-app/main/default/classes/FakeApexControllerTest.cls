/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an org are executed whenever Apex code is deployed
 * to a production org to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production org. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the org size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage. 123
 */
@isTest
private class FakeApexControllerTest {

    @isTest
    static void createNewAccountTest() {

        //  new version
        String accName = 'accName';
        String customLabel = System.Label.VitCustomLabel1;

        Test.startTest();
            FakeApexController.createNewAccount(accName);
        Test.stopTest();

        System.assertEquals(1, [SELECT COUNT() FROM Account]);
    }

    @isTest
    static void createNewContactTest() {

        String conName = 'conName';
        String conEmail = 'testcon@nonomail.com';

        Test.startTest();
            FakeApexController.createNewContact(conName, conEmail);
        Test.stopTest();

        System.assertEquals(1, [SELECT COUNT() FROM Contact]);
    }

}