
@isTest
private class JusttocheckTest {
    
    // Setup method to create common test data
    @testSetup
    static void setupTestData() {
        // Create test accounts for use in multiple test update
        List<Account> testAccounts = new List<Account>();
        testAccounts.add(new Account(Name = 'Test Account 1', Type = 'Customer'));
        testAccounts.add(new Account(Name = 'Test Account 2', Type = 'Prospect'));
        testAccounts.add(new Account(Name = 'Test Account 3', Type = 'Customer'));
        testAccounts.add(new Account(Name = 'Alpha Corp', Type = 'Partner'));
        testAccounts.add(new Account(Name = 'Beta Corp', Type = 'Customer'));
        insert testAccounts;
    }
    
    // Test method for createAccount - positive scenario
    @isTest
    static void testCreateAccountPositive() {
        Test.startTest();
        // Call the method to create a new account
        Id newAccountId = Justtocheck.createAccount('New Test Account', 'Customer');
        Test.stopTest();
        
        // Verify the account was created successfully
        Account createdAccount = [SELECT Id, Name, Type FROM Account WHERE Id = :newAccountId];
        System.assertEquals('New Test Account', createdAccount.Name, 'Account name should match');
        System.assertEquals('Customer', createdAccount.Type, 'Account type should match');
    }
    
    // Test method for createAccount - negative scenario with empty name
    @isTest
    static void testCreateAccountNegativeEmptyName() {
        Boolean exceptionThrown = false;
        Test.startTest();
        try {
            // Attempt to create account with empty name - should throw exception
            Id newAccountId = Justtocheck.createAccount('', 'Customer');
        } catch (Exception e) {
            exceptionThrown = true;
        }
        Test.stopTest();
        
        // Verify that an exception was thrown for invalid data
        System.assert(exceptionThrown, 'Should throw exception for empty account name');
    }
    
    // Test method for getAccountsByType - positive scenario
    @isTest
    static void testGetAccountsByTypePositive() {
        Test.startTest();
        // Retrieve accounts by type 'Customer'
        List<Account> customerAccounts = Justtocheck.getAccountsByType('Customer');
        Test.stopTest();
        
        // Verify the correct accounts are returned
        System.assert(customerAccounts.size() >= 2, 'Should find at least 2 customer accounts');
        for (Account acc : customerAccounts) {
            System.assertEquals('Customer', acc.Type, 'All returned accounts should be of type Customer');
        }
    }
    
    // Test method for getAccountsByType - negative scenario with non-existent type
    @isTest
    static void testGetAccountsByTypeNegative() {
        Test.startTest();
        // Attempt to retrieve accounts with non-existent type
        List<Account> nonExistentAccounts = Justtocheck.getAccountsByType('NonExistentType');
        Test.stopTest();
        
        // Verify no accounts are returned for non-existent type
        System.assertEquals(0, nonExistentAccounts.size(), 'Should return empty list for non-existent type');
    }
    
    // Test method for updateAccountNames - positive scenario
    @isTest
    static void testUpdateAccountNamesPositive() {
        // Get existing customer accounts to update
        List<Account> existingAccounts = [SELECT Id FROM Account WHERE Type = 'Customer' LIMIT 2];
        List<Id> accountIds = new List<Id>();
        for (Account acc : existingAccounts) {
            accountIds.add(acc.Id);
        }
        
        Test.startTest();
        // Update account names
        Justtocheck.updateAccountNames(accountIds, 'Updated Name');
        Test.stopTest();
        
        // Verify the accounts were TEST
        List<Account> updatedAccounts = [SELECT Id, Name FROM Account WHERE Id IN :accountIds];
        for (Account acc : updatedAccounts) {
            System.assertEquals('Updated Name', acc.Name, 'Account name should be');
        }
    }
    
    // Test method for updateAccountNames - negative scenario with empty ID list
    @isTest
    static void testUpdateAccountNamesNegativeEmptyList() {
        Boolean exceptionThrown = false;
        Test.startTest();
        try {
            // Attempt to update with empty ID list
            Justtocheck.updateAccountNames(new List<Id>(), 'New Name');
        } catch (Exception e) {
            exceptionThrown = true;
        }
        Test.stopTest();
        
        // Verify no exception is thrown for empty list (should handle gracefully)
        System.assert(!exceptionThrown, 'Should handle empty list without exception');
    }
    
    // Test method for deleteAccounts - positive scenario
    @isTest
    static void testDeleteAccountsPositive() {
        // Get accounts to delete
        List<Account> accountsToDelete = [SELECT Id FROM Account WHERE Type = 'Prospect'];
        List<Id> accountIds = new List<Id>();
        for (Account acc : accountsToDelete) {
            accountIds.add(acc.Id);
        }
        
        Test.startTest();
        // Delete the accounts
        Justtocheck.deleteAccounts(accountIds);
        Test.stopTest();
        
        // Verify the accounts were deleted
        List<Account> remainingAccounts = [SELECT Id FROM Account WHERE Id IN :accountIds];
        System.assertEquals(0, remainingAccounts.size(), 'All specified accounts should be deleted');
    }
    
    // Test method for accountExists - positive scenario
    @isTest
    static void testAccountExistsPositive() {
        Test.startTest();
        // Check if existing account exists
        Boolean exists = Justtocheck.accountExists('Test Account 1');
        Test.stopTest();
        
        // Verify the method correctly identifies existing account
        System.assert(exists, 'Should return true for existing account');
    }
    
    // Test method for accountExists - negative scenario
    @isTest
    static void testAccountExistsNegative() {
        Test.startTest();
        // Check if non-existent account exists
        Boolean exists = Justtocheck.accountExists('Non Existent Account');
        Test.stopTest();
        
        // Verify the method correctly identifies non-existent account
        System.assert(!exists, 'Should return false for non-existent account');
    }
    
    // Test method for getAccountsByName - positive scenario
    @isTest
    static void testGetAccountsByNamePositive() {
        Test.startTest();
        // Retrieve accounts by exact name
        List<Account> accounts = Justtocheck.getAccountsByName('Test Account 1');
        Test.stopTest();
        
        // Verify correct account is returned
        System.assertEquals(1, accounts.size(), 'Should find exactly one account with name "Test Account 1"');
        System.assertEquals('Test Account 1', accounts[0].Name, 'Account name should match');
    }
    
    // Test method for getAccountsByNameContains - positive scenario
    @isTest
    static void testGetAccountsByNameContainsPositive() {
        Test.startTest();
        // Retrieve accounts containing 'Test' in name
        List<Account> accounts = Justtocheck.getAccountsByNameContains('Test');
        Test.stopTest();
        
        // Verify multiple accounts are returned
        System.assert(accounts.size() >= 3, 'Should find at least 3 accounts containing "Test" in name');
        for (Account acc : accounts) {
            System.assert(acc.Name.contains('Test'), 'Account name should contain "Test"');
        }
    }
    
    // Test method for getAccountsByNamePattern - positive scenario
    @isTest
    static void testGetAccountsByNamePatternPositive() {
        Test.startTest();
        // Retrieve accounts matching pattern
        List<Account> accounts = Justtocheck.getAccountsByNamePattern('Corp');
        Test.stopTest();
        
        // Verify accounts with 'Corp' in name are returned
        System.assert(accounts.size() >= 2, 'Should find at least 2 accounts with "Corp" in name');
        for (Account acc : accounts) {
            System.assert(acc.Name.contains('Corp'), 'Account name should contain "Corp"');
        }
    }
    
    // Test method for createMultipleAccounts - positive scenario
    @isTest
    static void testCreateMultipleAccountsPositive() {
        // Prepare test data for bulk creation
        List<Map<String, String>> accountDataList = new List<Map<String, String>>();
        
        Map<String, String> account1 = new Map<String, String>();
        account1.put('Name', 'Bulk Account 1');
        account1.put('Type', 'Customer');
        accountDataList.add(account1);
        
        Map<String, String> account2 = new Map<String, String>();
        account2.put('Name', 'Bulk Account 2');
        account2.put('Type', 'Prospect');
        accountDataList.add(account2);
        
        Map<String, String> account3 = new Map<String, String>();
        account3.put('Name', 'Bulk Account 3');
        account3.put('Type', 'Partner');
        accountDataList.add(account3);
        
        Test.startTest();
        // Create multiple accounts
        List<Id> createdIds = Justtocheck.createMultipleAccounts(accountDataList);
        Test.stopTest();
        
        // Verify all accounts were created
        System.assertEquals(3, createdIds.size(), 'Should create 3 accounts');
        
        List<Account> createdAccounts = [SELECT Id, Name, Type FROM Account WHERE Id IN :createdIds];
        System.assertEquals(3, createdAccounts.size(), 'Should retrieve all 3 created accounts');
        
        // Verify each account's details
        for (Account acc : createdAccounts) {
            System.assert(acc.Name.startsWith('Bulk Account'), 'Account name should start with "Bulk Account"');
            System.assert(acc.Type != null, 'Account type should not be null');
        }
    }
    
    // Test method for createMultipleAccounts - negative scenario with empty list
    @isTest
    static void testCreateMultipleAccountsNegativeEmptyList() {
        Boolean exceptionThrown = false;
        Test.startTest();
        try {
            // Attempt to create accounts with empty list
            List<Id> createdIds = Justtocheck.createMultipleAccounts(new List<Map<String, String>>());
        } catch (Exception e) {
            exceptionThrown = true;
        }
        Test.stopTest();
        
        // Verify no exception is thrown for empty list
        System.assert(!exceptionThrown, 'Should handle empty list without exception');
    }
    
    // Test method for deleteAccountsByName - positive scenario
    @isTest
    static void testDeleteAccountsByNamePositive() {
        // First, create an account with a specific name to delete
        Account testAccount = new Account(Name = 'Account To Delete', Type = 'Test');
        insert testAccount;
        
        Test.startTest();
        // Delete accounts by name
        Justtocheck.deleteAccountsByName('Account To Delete');
        Test.stopTest();
        
        // Verify the account was deleted
        List<Account> remainingAccounts = [SELECT Id FROM Account WHERE Name = 'Account To Delete'];
        System.assertEquals(0, remainingAccounts.size(), 'Account should be deleted');
    }
    
    // Test method for deleteAccountsByName - negative scenario with non-existent name
    @isTest
    static void testDeleteAccountsByNameNegative() {
        Boolean exceptionThrown = false;
        Test.startTest();
        try {
            // Attempt to delete accounts with non-existent name
            Justtocheck.deleteAccountsByName('Non Existent Account Name');
        } catch (Exception e) {
            exceptionThrown = true;
        }
        Test.stopTest();
        
        // Verify no exception is thrown for non-existent name
        System.assert(!exceptionThrown, 'Should handle non-existent name without exception');
    }
    
    // Test method for bulk operations and governor limits
    @isTest
    static void testBulkOperations() {
        // Prepare data for bulk testing (200 records - typical bulk test size)
        List<Map<String, String>> bulkData = new List<Map<String, String>>();
        for (Integer i = 0; i < 200; i++) {
            Map<String, String> accountData = new Map<String, String>();
            accountData.put('Name', 'Bulk Test Account ' + i);
            accountData.put('Type', 'Bulk Type');
            bulkData.add(accountData);
        }
        
        Test.startTest();
        // Test bulk creation
        List<Id> createdIds = Justtocheck.createMultipleAccounts(bulkData);
        
        // Test bulk retrieval
        List<Account> retrievedAccounts = Justtocheck.getAccountsByType('Bulk Type');
        
        // Test bulk update
        Justtocheck.updateAccountNames(createdIds, 'Updated Bulk Name');
        
        // Test bulk deletion
        Justtocheck.deleteAccounts(createdIds);
        Test.stopTest();
        
        // Verify bulk operations completed successfully
        System.assertEquals(200, createdIds.size(), 'Should create 200 accounts in bulk');
        
        // Verify accounts were updated before deletion
        List<Account> updatedAccounts = [SELECT Id FROM Account WHERE Name = 'Updated Bulk Name' AND Id IN :createdIds];
        System.assert(updatedAccounts.size() > 0, 'Should have updated accounts before deletion');
        
        // Verify accounts were deleted
        List<Account> deletedAccounts = [SELECT Id FROM Account WHERE Id IN :createdIds];
        System.assertEquals(0, deletedAccounts.size(), 'All bulk accounts should be deleted');
    }
    
    // Test method for mixed operations scenario
    @isTest
    static void testMixedOperationsScenario() {
        // Create initial account
        Test.startTest();
        Id accountId = Justtocheck.createAccount('Mixed Ops Account', 'Mixed Type');
        
        // Verify account exists
        Boolean exists = Justtocheck.accountExists('Mixed Ops Account');
        System.assert(exists, 'Newly created account should exist');
        
        // Update the account
        List<Id> idList = new List<Id>{accountId};
        Justtocheck.updateAccountNames(idList, 'Updated Mixed Account');
        
        // Retrieve by type
        List<Account> mixedAccounts = Justtocheck.getAccountsByType('Mixed Type');
        System.assertEquals(1, mixedAccounts.size(), 'Should find the mixed type account');
        
        // Delete the account
        Justtocheck.deleteAccounts(idList);
        
        // Verify deletion
        exists = Justtocheck.accountExists('Updated Mixed Account');
        System.assert(!exists, 'Deleted account should not exist');
        Test.stopTest();
    }
}
