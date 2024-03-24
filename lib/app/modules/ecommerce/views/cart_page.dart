import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial_series/app/modules/ecommerce/controllers/ecommerce_controller.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final con = Get.put(EcommerceController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Text("YOur cart"),
          Divider(),
          //loop cart item
          for (var i = 0; i < con.cart.length; i++)
            Row(
              children: [
                Text("${con.cart[i].name}"),
                SizedBox(width: 10),
                Text("X"),
                SizedBox(
                  width: 10,
                ),
                Text("${con.cart[i].count.toString()}"),
                Spacer(),
                Text("${con.cart[i].price.toString()}")
              ],
            )
        ],
      )),
    );
  }
}
