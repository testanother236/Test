public with sharing class AccountHandler {

    /**
     * Updates the Account name by Id.
     */
    public static void updateAccountName(Id accountId, String newName) {
        // INTENTIONAL: Minor CRUD violation (no permission check)
        Account acc = [SELECT Id, Name FROM Account WHERE Id = :accountId LIMIT 1];
        acc.Name = newName;
        update acc; // This triggers exactly 1 minor ApexCRUDViolation
    }
}



