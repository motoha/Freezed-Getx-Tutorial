import 'package:get/get.dart';

import '../model/cart.dart';

class EcommerceController extends GetxController with StateMixin {
  RxList<Cart> cart = <Cart>[].obs;

  addTocart(id, name, double price, int count) {
    var getId = cart.where((Cart c) => c.id == id).toList();

    if (getId.isNotEmpty) {
      getId[0].price = price + getId[0].price;
      getId[0].count = count + getId[0].count;

      update();
      change(cart, status: RxStatus.success());
    } else {
      cart.add(Cart(id: id, name: name, price: price, total: 0, count: 1));
    }
    update();
    change(cart, status: RxStatus.success());
  }
}
