import 'package:flutter/material.dart';
import 'package:meeshoapp/widgets/productpreview_widget.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';

class ProductListWidget extends StatefulWidget {
  int index;
  ProductListWidget({super.key, this.index = 0});

  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductProvider>(context);
    final products = productsProvider.products.products[widget.index];

    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15),
      child: GridView.count(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        childAspectRatio: 0.50,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        children: List.generate(
          products.productList.length,
          (index) {
            return ProductPreviewWidget(
                productList: products.productList[index]);
          },
        ),
      ),
    );
  }
}
