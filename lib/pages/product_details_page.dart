import 'package:flutter/material.dart';
import 'package:second_app/utils/themes.dart';
import '../models/product.dart';

class HomeDetailPage extends StatelessWidget {
  final Product productDetails;
  const HomeDetailPage({Key? key, required this.productDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$${productDetails.price.toString()}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).secondaryHeaderColor,
                fontSize: 20,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  const StadiumBorder(),
                ),
                backgroundColor:
                    MaterialStateProperty.all(CustomTheme.darkColor),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text('Add To Cart'),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Hero(
                      tag: productDetails.image,
                      child: Image.network(
                        productDetails.image,
                        height: 130,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 3,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: productDetails.rating['rate'] > 4
                            ? Colors.green.shade500
                            : (productDetails.rating['rate'] < 2
                                ? Colors.red.shade500
                                : Colors.orange.shade500),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(3),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '${productDetails.rating['rate'].toString()}⭐',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 13),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productDetails.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        productDetails.description,
                        style: TextStyle(
                            color: Theme.of(context).secondaryHeaderColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Text(
                            'Category: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Text(
                            productDetails.category,
                            style: TextStyle(
                              color: Theme.of(context).secondaryHeaderColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
