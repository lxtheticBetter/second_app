import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:second_app/utils/routes.dart';
import 'package:second_app/utils/themes.dart';
import 'package:second_app/widgets/drawer.dart';
import 'package:second_app/widgets/product_widget.dart';
import '../models/product.dart';
// import '../utils/themes.dart';
import 'home_widgets/products_list.dart';
import 'home_widgets/products_screen_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  late List _products;
  late List _mappedProduct;
  final url = 'http://192.168.1.206:3001/'; //office
  // final url = 'http://192.168.1.5:3001/'; //home

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
      backgroundColor: Theme.of(context).canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, Routes.cartRoute),
        child: const Icon(CupertinoIcons.cart),
      ),
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
                  ProductsScreenHeader(resultCount: _products.length),
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
