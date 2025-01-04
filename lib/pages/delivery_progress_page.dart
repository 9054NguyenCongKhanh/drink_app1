import 'package:drink_app1/components/my_receipt.dart';
import 'package:flutter/material.dart';

class DeliveryProgressPage extends StatelessWidget {
  const DeliveryProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Đang giao hàng.. "),
        backgroundColor: Colors.transparent,
      ),
      body: const Column(
        children: [
          MyReceipt(),
        ],
      ),
    );
  }
}
