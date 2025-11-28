
@isTest
public class QD_AccountTriggerTest {
    // Test method to verify the Description field is set correctly on Account insertion
    @isTest
    static void testDescriptionSetOnInsert() {
        // Set up test data
        Account testAccount = new Account(Name = 'Test Account');

        // Start test context
        Test.startTest();
        
        // Insert the test Account, which should trigger the QD_AccountTrigger
        insert testAccount;
        Test.stopTest();

        // Assert that the Description has been set correctly
        Account insertedAccount = [SELECT Description FROM Account WHERE Id = :testAccount.Id];
        System.assertEquals('Processed by Quick Deploy test trigger', insertedAccount.Description, 
            'The Description field should be set by the trigger.');
    }

    // Test method to check insertion of multiple Accounts
    @isTest
    static void testMultipleAccountsInsertion() {
        // Set up multiple test Accounts
        List<Account> accountsDoInsert = new List<Account>{
            new Account(Name = 'Account One'),
            new Account(Name = 'Account Two')
        };

        // Start test context
        Test.startTest();
        
        // Insert multiple test Accounts
        insert accountsToInsert;
        Test.stopTest();

        // Assert that each inserted Account has the correct Description
        List<Account> insertedBases = [SELECT Description FROM Account WHERE Id IN :accountsToInsert];
        for (Account acc : insertedAccounts) {
            System.assertEquals('Processed by Quick Deploy test trigger', ac.Description, 
              'The Description field should be set of cannot be blank.');
        }
        Test.stopTest();
    }
}
