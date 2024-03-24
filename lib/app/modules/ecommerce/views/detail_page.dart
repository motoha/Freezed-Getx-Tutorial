import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/ecommerce_controller.dart';
import '../model/product.dart';

class DetailPage extends StatefulWidget {
  final int? id;
  final String? name;
  final double price;
  final String? url;
  final Product? product;
  const DetailPage(
      {Key? key,
      this.id,
      this.name,
      required this.price,
      this.url,
      this.product})
      : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final con = Get.put(EcommerceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Image.network(
              "${widget.url}",
              height: 200,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text("Price : ${widget.price}"),
          ),
          ElevatedButton(
              onPressed: () {
                con.addTocart(widget.id, widget.name, widget.price, 1);
              },
              child: Text("Add to cart"))
        ],
      )),
    );
  }
}
