import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sho_app_flutter/providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartDetails = Provider.of<CartProvider>(context);
    return cartDetails.cartItems.isEmpty
        ? Center(
            child: Text(
              'Cart is Empty',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          )
        : ListView.builder(
            itemCount: cartDetails.cartItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: const Text(
                                'Are you sure you want to delete this item'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'NO',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  cartDetails.removeFromCart(
                                      cartDetails.cartItems[index]);
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Yes',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          );
                        });
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
                title: Text(
                  '${cartDetails.cartItems[index]['title']} (\$${cartDetails.cartItems[index]['price']})',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                      (cartDetails.cartItems[index]['imageUrl']) as String),
                ),
                subtitle: Text('Size: ${cartDetails.cartItems[index]['size']}'),
              );
            },
          );
  }
}
