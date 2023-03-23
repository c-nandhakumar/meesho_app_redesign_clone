import 'package:flutter/material.dart';
import 'package:meeshoapp/screens/productdetails_screen.dart';

import '../models/products_model.dart';

class ProductPreviewWidget extends StatefulWidget {
  ProductList? productList;
  ProductPreviewWidget({this.productList, super.key});

  @override
  State<ProductPreviewWidget> createState() => _ProductPreviewWidgetState();
}

class _ProductPreviewWidgetState extends State<ProductPreviewWidget> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return widget.productList == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductDetailsScreen(
                    productList: widget.productList,
                  ),
                ),
              );
            },
            child: Container(
              height: 500,
              width: w * 0.40,
              color: Colors.grey[200],
              child: Column(children: [
                Stack(
                  children: [
                    Positioned(
                        child: ClipRRect(
                      child: Image(
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        image:
                            NetworkImage(widget.productList!.productImages[0]),
                      ),
                    )),
                    Positioned(
                        right: 10,
                        top: 10,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white54),
                          child: Center(
                            child: Icon(
                              Icons.favorite_border_sharp,
                              size: 20,
                              color: Colors.grey[400],
                            ),
                          ),
                        ))
                  ],
                ),
                Container(
                  color: Colors.white,
                  height: 102,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  width: double.infinity,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.productList!.productTitle,
                          overflow: TextOverflow.ellipsis,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 11),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "₹${widget.productList!.productPrice.toString()}",
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        Container(
                          height: 23.5,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.green[700]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "4.5",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Icon(
                                Icons.star,
                                size: 12,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ]),
                )
              ]),
            ),
          );
  }
}
