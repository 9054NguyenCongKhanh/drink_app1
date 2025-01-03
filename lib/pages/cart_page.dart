import 'package:drink_app1/models/cart_item.dart';
import 'package:drink_app1/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        //cart
        final userCart = restaurant.cart;

        //scaffold UI
        return Scaffold(
          appBar: AppBar(
            title: Text("Cart"),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: userCart.length,
                  itemBuilder: (context, index) {
                    //lay tung mat hang trong gio hang
                    final cartItem = userCart[index];

                    //return cart tile UI
                    return ListTile(
                      title: Text(cartItem.food.name),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}