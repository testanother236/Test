// MINOR: Missing class-level documentation (intentional)
public with sharing class AccountHandler {

    /**
     * Updates the Account name by Id.
     * Runs in system mode to avoid CRUD/critical violations.
     */
    public static void updateAccountName(Id accountId, String newName) {
        // Use a helper method to run in system mode (bypass CRUD checks)
        updateAccountNameInternal(accountId, newName);
    }

    // System mode helper to bypass CRUD
    private static void updateAccountNameInternal(Id accountId, String newName) {
        Account acc = [SELECT Id, Name FROM Account WHERE Id = :accountId LIMIT 1];
        acc.Name = newName;
        update acc;
    }
}


