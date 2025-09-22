public with sharing class AccountHandler {

    // MINOR: Missing method-level documentation (intentional for 1 minor issue)
    public static void updateAccountName(Id accountId, String newName) {
        Account acc = [SELECT Id, Name FROM Account WHERE Id = :accountId LIMIT 1];
        acc.Name = newName;
        update acc;
    }
}
