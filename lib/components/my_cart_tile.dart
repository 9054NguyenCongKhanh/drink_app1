import 'package:drink_app1/components/my_quantity_selector.dart';
import 'package:drink_app1/models/cart_item.dart';
import 'package:drink_app1/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;
  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
        builder: (context, retaurant, child) => Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      //food image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          cartItem.food.imagePath,
                          height: 100,
                          width: 100,
                        ),
                      ),
                      const SizedBox(width: 10),
                      //name and price
                      Column(
                        children: [
                          //food name
                          Text(cartItem.food.name),

                          //food price
                          Text('\$' + cartItem.food.price.toString()),
                        ],
                      ),

                      // tang giam so luong
                      QuantitySelector(
                        quantity: cartItem.quantity,
                        food: cartItem.food,
                        onDecrement: () {
                          retaurant.removeFromCart(cartItem);
                        },
                        onIncrement: () {
                          retaurant.addToCart(
                              cartItem.food, cartItem.selectedAddons);
                        },
                      )
                    ],
                  )
                ],
              ),
            ));
  }
}
