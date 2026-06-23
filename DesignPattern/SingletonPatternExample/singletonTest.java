package DesignPattern.SingletonPatternExample;

public class singletonTest {
    public static void main(String[] args) {

        Logger logger1 = Logger.getInstance();
        logger1.log("First Message");

        Logger logger2 = Logger.getInstance();
        logger2.log("Second Message");

        if (logger1 == logger2) {
            System.out.println("Only one Logger instance exists.");
        } else {
            System.out.println("Multiple Logger instances exist.");
        }
    }
}

