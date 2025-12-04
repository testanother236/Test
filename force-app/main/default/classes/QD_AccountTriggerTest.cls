
@isTest
public class QD_AccountTrigger_Test {
    
    // Test method to validate the trigger functionality on Account insert
    @isTest
    static void testQD_AccountTrigger_BeforeInsert() {
        // Start the test context
        Test.startTest();

        // Setup data
        Account testAccount = new Account(Name = 'Test Account');

        // Insert the account record which will invoke the trigger
        insert testAccount;

        // Stop the test context
        Test.stopTest();

        // Retrieve the inserted account to validate the trigger's logic
        Account insertedAccount = [SELECT Id, Description FROM Account WHERE Id = :testAccount.Id];

        // Validate that the Description field was set by the trigger
        System.assertEquals('Processed by Quick Deploy test trigger', insertedAccount.Description, 
            'The Description field should be updated by the trigger.');

        // Check that the account name remains unchanged
        System.assertEquals('Test Account', insertedAccount.Name, 
            'The Name field should not be altered by the trigger.');
    }
    
    // Test method to confirm that an Account can be inserted even without a Name
    @isTest
    static void testQD_AccountTrigger_WithoutName() {
        // Start the test context
        Test.startTest();

        // Setup data without a name (this simulates a potential issue but should not throw an error)
        Account testAccountWithoutName = new Account();

        // Insert the account record which will invoke the trigger
        insert testAccountWithoutName;

        // Stop the test context
        Test.stopTest();

        // Retrieve the inserted account to validate the trigger's logic
        Account insertedAccount = [SELECT Id, Description FROM Account WHERE Id = :testAccountWithoutName.Id];

        // Validate that the Description field was set by the trigger
        System.assertEquals('Processed by Quick Deploy test trigger', insertedAccount.Description, 
            'The Description field should still be updated by the trigger even if the account has no name.');

        // Confirm the acount's ID is not null
        System.assertNotEquals(null, insertedAccount.Id, 
            'The Account should be inserted successfully and should have a valid Id.');
    }
}
