import 'package:flutter/material.dart';
import 'package:second_app/pages/product_details_page.dart';
import 'package:second_app/pages/home_widgets/product_item.dart';

class ProductsList extends StatelessWidget {
  final List products;
  const ProductsList({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: products.length,
      itemBuilder: (context, i) {
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(productDetails: products[i]),
            ),
          ),
          child: ProductItem(
            productItem: products[i],
          ),
        );
      },
    );
  }
}
