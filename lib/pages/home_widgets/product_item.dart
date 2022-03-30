import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../../models/product.dart';
import '../../utils/themes.dart';

class ProductItem extends StatelessWidget {
  final Product productItem;
  const ProductItem({Key? key, required this.productItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Card(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Container(
          height: 140,
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Hero(
                  tag: productItem.image,
                  child: Image.network(
                    productItem.image,
                    width: 80,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text(
                              productItem.title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 3,
                              horizontal: 6,
                            ),
                            decoration: BoxDecoration(
                              color: productItem.rating['rate'] > 4
                                  ? Colors.green.shade500
                                  : (productItem.rating['rate'] < 2
                                      ? Colors.red.shade500
                                      : Colors.orange.shade500),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(3),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '${productItem.rating['rate'].toString()}⭐',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 13),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      productItem.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      // softWrap: false,
                      style: TextStyle(
                        fontSize: 11,
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${productItem.price.toString()}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                CustomTheme.darkColor,
                              ),
                            ),
                            child: const Text('Add To Cart'))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
