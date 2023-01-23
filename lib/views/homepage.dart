import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statemgmt/controller/cartcontroller.dart';
import 'package:statemgmt/controller/shoppingcontroller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.tealAccent,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: GetX<ShoppingController>(builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: ((context, index) {
                      return Card(
                        margin: const EdgeInsets.all(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.products[index].prodName,
                                          style: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                            controller.products[index].prodDesc)
                                      ],
                                    ),
                                    Text(
                                      '${controller.products[index].price}',
                                      style: const TextStyle(fontSize: 24),
                                    ),
                                  ],
                                ),
                                TextButton(
                                  onPressed: () {
                                    cartController
                                        .addToCart(controller.products[index]);
                                  },
                                  child: const Text('+ to cart'),
                                ),
                              ]),
                        ),
                      );
                    }),
                  );
                }),
              ),
              GetX<CartController>(builder: (controller) {
                return Text(
                  'Total Amount: ${controller.totalPrice}',
                  style: const TextStyle(fontSize: 24),
                );
              }),
              const SizedBox(height: 100)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          icon: const Icon(Icons.add_shopping_cart_rounded),
          label: Obx(() {
            return Text('${cartController.count}');
          }),
          // label: GetX<CartController>(builder: ((controller) {
          //   return Text('${controller.count}');
          // })),
        ));
  }
}
