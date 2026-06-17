import java.util.Scanner;
class Product {
    int productId;
    String productName;

    Product(int productId, String productName) {
        this.productId = productId;
        this.productName = productName;
    }
}
 class EcommerceSearch {

    public static Product linearSearchProduct(Product[] products, String key) {
        for (Product p : products) {
            if (p.productName.equalsIgnoreCase(key)) {
                return p;
            }
        }
        return null;
    }

    public static void main(String args[]) {

        Scanner sc = new Scanner(System.in);

        Product[] products = {
            new Product(101, "Laptop"),
            new Product(102, "RedmiPhone"),
            new Product(103, "Watch"),
            new Product(104, "IPad")
        };

        Product result = linearSearchProduct(products, "Watch");

        if (result != null) {
            System.out.println("Product Found");
            System.out.println("ProductID: " + result.productId);
            System.out.println("ProductName: " + result.productName);
        } else {
            System.out.println("Product Not Found");
        }

        sc.close();
    }
}