/**
 * @description Handler class for Account operations.
 */
public with sharing class AccountHandler {

    /**
     * @description Updates the Account name by Id.
     * INTENTIONAL MINOR: Does not check CRUD permissions.
     * @param accountId The Id of the Account to update.
     * @param newName The new name for the Account.
     */
    public static void updateAccountName(Id accountId, String newName) {
        // Only one CRUD violation (minor) here
        Account acc = new Account(Id = accountId);
        acc.Name = newName;
        update acc; // triggers 1 minor ApexCRUDViolation
    }
}
