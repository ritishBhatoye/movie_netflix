import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/movieDetailedProvider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        if (cartProvider.cartItems.isEmpty) {
          return Center(
            child: Text(
              'Your cart is empty',
              style: TextStyle(color: Colors.white),
            ),
          );
        } else {
          return ListView.builder(
            itemCount: cartProvider.cartItems.length,
            itemBuilder: (context, index) {
              final item = cartProvider.cartItems[index];
              return ListTile(
                leading: Image.network(item.image),
                title: Text(item.name, style: TextStyle(color: Colors.white)),
                subtitle: Text(item.year, style: TextStyle(color: Colors.white70)),
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle, color: Colors.red),
                  onPressed: () {
                    cartProvider.removeFromCart(item);
                  },
                ),
              );
            },
          );
        }
      },
    );
  }
}
