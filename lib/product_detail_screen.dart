import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final Map<String, Object> product;

  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Details",
        ),
      ),
      body: Column(
        children: [
          Text(
            product['title'].toString(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
