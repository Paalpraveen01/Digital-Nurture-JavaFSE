public class FinancialForecasting {

    public static double forecast(double amount, double rate, int years) {

    
        if (years == 0) {
            return amount;
        }

        return forecast(amount, rate, years - 1) * (1 + rate);
    }

    public static void main(String[] args) {

        double amount = 10000;
        double rate = 0.10;
        int years = 5;

        double futureValue = forecast(amount, rate, years);

        System.out.println("Future Value: " + futureValue);
    }
}