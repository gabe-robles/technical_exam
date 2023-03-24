import 'package:flutter_test/flutter_test.dart';
import 'package:technical_exam/services/network/products.dart';

void main() {

  test("Discount calculation test", () {
    final ProductsServices products = ProductsServices();

    final double discountedAmount = products.getDiscountedAmount(
      price: 1000,
      discountPercentage: 20,
    );

    expect(discountedAmount, 800.0);
  });

}