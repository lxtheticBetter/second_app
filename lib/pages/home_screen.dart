import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:second_app/widgets/drawer.dart';
import 'package:second_app/widgets/product_widget.dart';
import '../models/product.dart';
import '../utils/themes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  late List _products;
  late List _mappedProduct;
  final url = 'http://192.168.1.206:3001/';

  void fetchData() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        // print((response.body).runtimeType);
        _products = jsonDecode(response.body);
        _mappedProduct =
            _products.map((product) => Product.fromJson(product)).toList();
        // print(_products.runtimeType);
        isLoading = false;
      });
    } else {
      throw Exception('Unable to retrieve products.');
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
/*       appBar: AppBar(
        title: const Text(
          'Products',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ), */
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          :
          // Text('${_products.length} Result(s)'),
/*           ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: _products.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ProductWidget(product: Product.fromJson(_products[i])),
                );
              },
            ), */
          SafeArea(
              child: Column(
                children: [
                  const ProductsPageHeader(),
/*                   GridView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, mainAxisSpacing: 16),
                    itemCount: _products.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: GridTile(
                            child: Image.network(
                              _mappedProduct[i].image,
                              height: 60,
                              width: 60,
                            ),
                            header: Container(
                              child: Text(_mappedProduct[i].title),
                              decoration: const BoxDecoration(),
                            ),
                            footer:
                                Text('\$${_mappedProduct[i].price.toString()}'),
                          ),
                        ),
                      );
                    },
                  ) */
                  Expanded(child: ProductsList(products: _mappedProduct)),
                ],
              ),
            ),
      drawer: const HomeDrawer(),
    );
  }
}

class ProductsPageHeader extends StatelessWidget {
  const ProductsPageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Products',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: CustomTheme.darkColor,
            ),
          ),
          Text(
            'Trending Products',
            style: TextStyle(
              color: CustomTheme.darkColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

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
        return ProductItem(productItem: products[i]);
      },
    );
  }
}

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
                child: Image.network(
                  productItem.image,
                  width: 80,
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 2),
                      child: Text(
                        productItem.title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: CustomTheme.darkColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      productItem.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      // softWrap: false,
                      style:
                          const TextStyle(fontSize: 11, color: Colors.black54),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${productItem.price.toString()}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: CustomTheme.darkColor,
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  CustomTheme.darkColor),
                            ),
                            child: const Text('Buy'))
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
