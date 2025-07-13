import 'package:flutter/material.dart';
import '../Models/globalCart.dart';
import '../Models/ProductModel.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void removeFromCart(ProductModel product) {
    setState(() {
      globalCart.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    final totalPrice = globalCart.fold<double>(
      0,
          (sum, item) => sum + item.price,
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Cart")),
      body: globalCart.isEmpty
          ? const Center(child: Text("Your cart is empty"))
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: globalCart.length,
              itemBuilder: (context, index) {
                final product = globalCart[index];
                return ListTile(
                  leading: Image.network(product.image, width: 50),
                  title: Text(product.title),
                  subtitle: Text("₹${product.price.toStringAsFixed(2)}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => removeFromCart(product),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text("Total: ₹${totalPrice.toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Order placed (dummy)")),
                    );
                  },
                  child: const Text("Buy Now"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
