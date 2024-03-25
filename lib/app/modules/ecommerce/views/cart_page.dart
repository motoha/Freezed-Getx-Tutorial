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
          child: Obx(() => Column(
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
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                con.addTocart(con.cart[i].id, con.cart[i].name,
                                    con.cart[i].price, 1);
                              });
                            },
                            child: Text("+")),
                        SizedBox(
                          width: 10,
                        ),
                        Text("${con.cart[i].count.toString()}"),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                con.delete(con.cart[i].id, con.cart[i].price);
                              });
                            },
                            child: Text("-")),
                        Spacer(),
                        Text("${con.cart[i].total.toString()}")
                      ],
                    ),
                  ElevatedButton(
                      onPressed: () {
                        var map = {};
                        for (var i = 0; i < con.cart.length; i++) {
                          map.addAll({
                            "id[$i]": con.cart[i].id,
                            "product_name[$i]": con.cart[i].name,
                            "total[$i]": con.cart[i].total,
                            "count[$i]": con.cart[i].count
                          });
                        }
                        print(map);
                      },
                      child: Text("Checkout"))
                ],
              )),
        ));
  }
}
