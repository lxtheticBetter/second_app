import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  const ProductWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        leading: Image.network(
          product.image,
          height: 60,
          width: 60,
        ),
        title: Text(product.title),
        subtitle: Text(product.description),
        trailing: Text(
          '\$${product.price.toString()}',
          style: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
