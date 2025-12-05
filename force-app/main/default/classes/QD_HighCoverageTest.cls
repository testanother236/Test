
@isTest
public class QD_HighCoverageTest {
    
    // Test method for doubleIt with a positive scenario
    @isTest
    static void testDoubleItPositive() {
        // Setup
        Integer inputValue = 5; // Input value set to a positive integer
        
        Test.startTest();
        // Test execution
        Integer result = QD_HighCoverage.doubleIt(inputValue);
        Test.stopTest();
        
        // Assert the expected outcome
        System.assertEquals(10, result, 'The doubleIt method should return double the input value.');
    }

    // Test method for doubleIt with a negative scenario
    @isTest
    static void testDoubleItNegative() {
        // Setup
        Integer inputValue = -3; // Input value set to a negative integer
        
        Test.startTest();
        // Test execution
        Integer result = QD_HighCoverage.doubleIt(inputValue);
        Test.stopTest();
        
        // Assert the expected outcome
        System.assertEquals(-6, result, 'The doubleIt method should return double the input value even if it is negative.');
    }

    // Test method for doubleIt with zero value
    @isTest
    static void testDoubleItZero() {
        // Setup
        Integer inputValue = 0; // Input value set to zero
        
        Test.startTest();
        // Test execution
        Integer result = QD_HighCoverage.doubleIt(inputValue);
        Test.stopTest();
        
        // Assert the expected outcome
        System.assertEquals(0, result, 'The doubleIt method should return 0 when the input value is 0.');
    }
}
