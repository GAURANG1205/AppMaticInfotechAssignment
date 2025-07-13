import 'package:appmaticassignment/Common/customScaffoldMessage.dart';
import 'package:flutter/material.dart';
import '../Models/ProductModel.dart';


class ProductDetailScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.network(product.image, height: 200),
            const SizedBox(height: 16),
            Text(product.title, style: const TextStyle(fontSize: 20)),
            Text("₹${product.price.toStringAsFixed(2)}", style: const TextStyle(color: Colors.green)),
            const SizedBox(height: 10),
            Expanded(child: SingleChildScrollView(child: Text(product.description))),
            ElevatedButton.icon(
              icon: const Icon(Icons.add_shopping_cart),
              label: const Text("Add to Cart"),
              onPressed: () {
           ScaffoldMessage.showSnackBar(context, message: "Added to Cart",isError: false);
              },
            )
          ],
        ),
      ),
    );
  }
}
