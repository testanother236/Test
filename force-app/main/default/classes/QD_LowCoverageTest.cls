
@isTest
public class QD_LowCoverageTest {
    // Test method for the riskyDivide method with a valid denominator (positive scenario)
    @isTest
    static void testRiskyDivide_PositiveScenario() {
        // Setup: Define test inputs where division is valid
        Integer numerator = 10;
        Integer denominator = 2;
        Integer expectedResult = 5; // 10 / 2 = 5
        
        Test.startTest(); // Start test execution context
        // Execute: Call the method under test
        Integer actualResult = QD_LowCoverage.riskyDivide(numerator, denominator);
        Test.stopTest(); // Stop test execution context
        
        // Verify: Assert that the result matches the expected value
        System.assertEquals(expectedResult, actualResult, 'The division result should be 5 when dividing 10 by 2.');
    }
    
    // Test method for the riskyDivide method with a denominator of zero (negative scenario)
    @isTest
    static void testRiskyDivide_NegativeScenario_DivideByZero() {
        // Setup: Define test inputs where division by zero is attempted
        Integer numerator = 10;
        Integer denominator = 0;
        
        Test.startTest(); // Start test execution context
        // Execute: Call the method under test
        Integer actualResult = QD_LowCoverage.riskyDivide(numerator, denominator);
        Test.stopTest(); // Stop test execution context
        
        // Verify: Assert that the method returns null for division by zero
        System.assertEquals(null, actualResult, 'The method should return null when attempting to divide by zero.');
    }
    
    // Test method for the riskyDivide method with a negative denominator
    @isTest
    static void testRiskyDivide_NegativeDenominator() {
        // Setup: Test division with a negative number
        Integer numerator = 10;
        Integer denominator = -2;
        Integer expectedResult = -5; // 10 / -2 = -5
        
        Test.startTest(); // Start test execution context
        // Execute: Call the method under test
        Integer actualResult = QD_LowCoverage.riskyDivide(numerator, denominator);
        Test.stopTest(); // Stop test execution context
        
        // Verify: Assert that the result matches the expected value
        System.assertEquals(expectedResult, actualResult, 'The division result should be -5 when dividing 10 by -2.');
    }
    
    // Test method for the riskyDivide method with a zero numerator
    @isTest
    static void testRiskyDivide_ZeroNumerator() {
        // Setup: Test division where the numerator is zero
        Integer numerator = 0;
        Integer denominator = 5;
        Integer expectedResult = 0; // 0 / 5 = 0
        
        Test.startTest(); // Start test execution context
        // Execute: Call the method under test
        Integer actualResult = QD_LowCoverage.riskyDivide(numerator, denominator);
        Test.stopTest(); // Stop test execution context
        
        // Verify: Assert that the result matches the expected value
        System.assertEquals(expectedResult, actualResult, 'The division result should be 0 when dividing 0 by 5.');
    }
}
//test
