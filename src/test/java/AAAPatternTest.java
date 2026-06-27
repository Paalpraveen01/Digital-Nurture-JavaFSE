import static org.junit.Assert.assertEquals;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class AAAPatternTest {

    private Calculator calculator;

    @Before
    public void setUp() {
        calculator = new Calculator();
        System.out.println("Setup Method Executed");
    }

    @After
    public void tearDown() {
        calculator = null;
        System.out.println("Teardown Method Executed");
    }

    @Test
    public void testAdd() {

        // Arrange
        int num1 = 15;
        int num2 = 25;

        // Act
        int result = calculator.add(num1, num2);

        // Assert
        assertEquals(40, result);
    }
}