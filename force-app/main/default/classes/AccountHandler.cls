public with sharing class AccountHandler {

    // MINOR: Missing method-level documentation (intentional)
    public static void updateAccountName(Id accountId, String newName) {
        // Check CRUD permissions to avoid ApexCRUDViolation
        if (!Schema.sObjectType.Account.isAccessible() || !Schema.sObjectType.Account.fields.Name.isUpdateable()) {
            return; // safely exit if user has no access
        }

        Account acc = [SELECT Id, Name FROM Account WHERE Id = :accountId LIMIT 1];
        acc.Name = newName;
        update acc;
    }
}

