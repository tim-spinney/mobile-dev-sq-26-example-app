import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'shopping_cart.dart';
import 'shopping_cart_item.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shoppingCartItems = context
        .select<ShoppingCart, List<ShoppingCartItem>>((cart) => cart.items);
    final grandTotalPriceInCents = context.select<ShoppingCart, int>(
      (cart) => cart.grandTotalPriceInCents,
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Cart'), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: shoppingCartItems.length,
            itemBuilder: (context, index) =>
                _ShoppingCartListItem(shoppingCartItems[index]),
          ),
          Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Padding(
              padding: EdgeInsetsGeometry.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total: \$${grandTotalPriceInCents / 100}'),
                  ElevatedButton(
                    onPressed: null,
                    child: const Text('Check out'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ShoppingCartListItem extends StatelessWidget {
  final ShoppingCartItem item;

  const _ShoppingCartListItem(this.item);

  _onRemovePressed(BuildContext context) {
    context.read<ShoppingCart>().removeItem(item.foodItem);
  }

  @override
  Widget build(BuildContext context) {
    // Note: in reality we'd want to use a library to get the proper display formatting for currencies
    final priceInDollars = item.foodItem.priceInCents / 100;
    final totalPrice = item.totalPriceInCents / 100;
    return Card(
      child: ListTile(
        title: Text(item.foodItem.name),
        leading: Text('\$$totalPrice'),
        subtitle: Text('${item.quantity} × \$$priceInDollars'),
        trailing: IconButton(
          onPressed: () { _onRemovePressed(context); },
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }
}
