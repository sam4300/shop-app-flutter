import 'package:flutter/material.dart';
import 'package:sho_app_flutter/global_variables.dart';
import 'package:sho_app_flutter/product_detail_screen.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Color backgroundColor;
  final int index;
  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.backgroundColor,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  ProductDetailScreen(product:products[index],),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: backgroundColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              '\$ $price',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Center(
              child: Image.asset(
                image,
                height: 175,
              ),
            )
          ],
        ),
      ),
    );
  }
}
