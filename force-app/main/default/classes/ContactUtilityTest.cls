@IsTest
public class ContactUtilityTest {
    @IsTest
    static void verifyContactUtility() {
        // Arrange
        Contact c = new Contact(LastName = 'Tester');
        insert c;

        // Act
        Integer countContacts = [SELECT COUNT() FROM Contact WHERE LastName = 'Tester'];

        // Assert
        System.assertEquals(1, countContacts, 'Exactly one test contact should exist');
    }
}


// update 2026-10-22T18:10:22.535Z

// update 2026-10-22T18:11:53.460Z

// update 2026-10-22T18:12:43.363Z

// update 2026-10-22T18:12:48.519Z

// update 2026-10-22T18:14:23.544Z
