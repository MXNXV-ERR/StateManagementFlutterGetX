import 'package:get/state_manager.dart';
import 'package:statemgmt/models/product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    var serverResponse = [
      Product(
          id: 1,
          price: 30,
          prodDesc: 'desc1',
          prodName: 'Prod1',
          prodImage: 'asdf'),
      Product(
          id: 2,
          price: 40,
          prodDesc: 'desc2',
          prodName: 'Prod2',
          prodImage: 'sdf'),
      Product(
          id: 3,
          price: 20,
          prodDesc: 'desc3',
          prodName: 'Prod3',
          prodImage: 'sdfasdf')
    ];

    products.value = serverResponse;
  }
}
