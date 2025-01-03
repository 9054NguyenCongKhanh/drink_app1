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
                      Image.asset(
                        cartItem.food.imagePath,
                        height: 100,
                        width: 100,
                      ),
                    ],
                  )
                ],
              ),
            ));
  }
}
