import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ecommerce_controller.dart';
import '../model/product.dart';
import 'cart_page.dart';
import 'detail_page.dart';

class EcommerceView extends GetView<EcommerceController> {
  const EcommerceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final con = Get.put(EcommerceController());
    final List<Product> products = [
      Product(
          id: 1,
          name: 'Best Shoes',
          price: 10.0,
          imageUrl:
              'https://images.pexels.com/photos/19090/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
      Product(
          id: 2,
          name: 'Nice Shoe',
          price: 20,
          imageUrl:
              'https://images.pexels.com/photos/267320/pexels-photo-267320.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
      Product(
          id: 3,
          name: 'Wow Shoe',
          price: 50,
          imageUrl:
              'https://images.pexels.com/photos/1598508/pexels-photo-1598508.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
      Product(
          id: 4,
          name: 'Great Shoe',
          price: 80,
          imageUrl:
              'https://images.pexels.com/photos/292999/pexels-photo-292999.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('EcommerceView'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(Cart());
              },
              icon: Icon(Icons.shopping_basket))
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 2.0,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductItem(product: products[index]);
        },
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(DetailPage(
          id: product.id,
          name: product.name,
          price: product.price,
          url: product.imageUrl,
        ));
      },
      child: Card(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                product.imageUrl,
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '\$${product.price}',
                      style: const TextStyle(fontSize: 14.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      product.name,
                      style: const TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
