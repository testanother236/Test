@isTest
private class GenshinTest {
    
    /**
     * Test method to verify the instantiation of the Genshin class.
     * This is a basic positive test to ensure the class can be constructed without errors.
     */
    @isTest
    static void testGenshinInstantiation() {
        // Start the test context to isolate DML and other operations
        Test.startTest();
        
        // Create an instance of the Genshin class
        Genshin genshinInstance = new Genshin();
        // Verify that the instance is not null, confirming successful instantiation
        System.assertNotEquals(null, genshinInstance, 'Genshin instance should not be null.');
        
        Test.stopTest();
    }
    
    /**
     * Test method to confirm the class name and type.
     * This test checks that the class is of the expected type.
     */
    @isTest
    static void testGenshinClassType() {
        Test.startTest();
        
        Genshin genshinInstance = new Genshin();
        // Assert that the instance is of type Genshin
        System.assert(genshinInstance instanceof Genshin, 'Instance should be of type Genshin.');
        
        Test.stopTest();
    }
}