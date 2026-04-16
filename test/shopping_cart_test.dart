import 'package:flutter_test/flutter_test.dart';
import 'package:pizza_app/shopping_cart.dart';

main() {
  test('hello world example', () {
    // setup/given/arrange
    // set up subject under test and inputs

    // execution/when/act
    // execution of a specific function
    int result = 34 + 34;

    // validation/then/assert
    // assertions about outcomes
    expect(result, equals(68));
  });

  test('given an empty shopping cart, when I check how many items it has, then it returns 0', () {
    // given
    final cart = ShoppingCart();

    // when
    int result = cart.numDistinctItems;

    // then
    expect(result, equals(0));
  });
}