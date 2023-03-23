import 'package:flutter/material.dart';
import 'package:meeshoapp/providers/products_provider.dart';
import 'package:meeshoapp/widgets/productlist_widget.dart';
import 'package:meeshoapp/widgets/productpreview_widget.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatefulWidget {
  int index;
  ProductListScreen({this.index = 0, super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductProvider>(context);
    final products = productsProvider.products.products[widget.index];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,

              // ignore: prefer_const_literals_to_create_immutables
              children: [
                IconButton(
                    color: Colors.black,
                    icon: const Icon(Icons.chevron_left),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                Text(
                  products.clothing.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyText2,
                )
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.favorite_border_outlined,
              color: Colors.black,
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.notifications_none_outlined,
              color: Colors.black,
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
            ),
          ]),
        ),
        body: ProductListWidget(index: widget.index));
  }
}
