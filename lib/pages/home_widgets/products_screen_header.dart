import 'package:flutter/material.dart';
import '../../utils/themes.dart';

class ProductsScreenHeader extends StatelessWidget {
  final int resultCount;
  const ProductsScreenHeader({Key? key, required this.resultCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Products',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Trending Products',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 16,
                ),
              ),
              Text(
                '${resultCount.toString()} Result(s)',
                style: TextStyle(
                    color: Theme.of(context).secondaryHeaderColor,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
