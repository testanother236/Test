// MINOR: Missing class-level documentation (intentional)
public with sharing class AccountHandler {

    /**
     * Updates the Account name by Id.
     * Checks CRUD permissions to avoid violations.
     */
    public static void updateAccountName(Id accountId, String newName) {
        // Check CRUD permissions
        if (!Schema.sObjectType.Account.isAccessible() || 
            !Schema.sObjectType.Account.fields.Name.isUpdateable()) {
            return; // exit safely if user has no access
        }

        Account acc = [SELECT Id, Name FROM Account WHERE Id = :accountId LIMIT 1];
        acc.Name = newName;
        update acc;
    }
}

