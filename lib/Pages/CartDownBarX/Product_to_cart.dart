import 'package:FooDash_App/Pages/CartDownBarX/CartXControllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Cart.dart';
import 'ProductModels_Cart.dart';

class ProductListPage extends StatelessWidget {
  final CartXControllerS cartController = Get.put( CartXControllerS());

  final List<Product> products = [
    Product(id: '1', name: 'Apple', price: 1.50, ),
    Product(id: '2', name: 'Banana', price: 0.75,),
  ];

  ProductListPage(product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Get.to(const CartPageContent());
            },
          ),
          Obx(() => Text('${cartController.totalItems}')),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('\$${product.price}'),
            trailing: ElevatedButton(
              onPressed: () {
              },
              child: const Text('Add to Cart'),
            ),
          );
        },
      ),
    );
  }
}

extension on CartXControllerS {
  get totalItems => null;
}
