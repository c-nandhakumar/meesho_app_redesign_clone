import 'package:flutter/material.dart';

import 'package:meeshoapp/widgets/categorylist_widget.dart';
import 'package:meeshoapp/widgets/productlist_widget.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    productProvider.fetchData;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
                pinned: false,
                backgroundColor: Colors.white,
                flexibleSpace: Container(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.grey,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Meesho User",
                              style: TextStyle(fontWeight: FontWeight.w700),
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
                )),
            SliverAppBar(
                elevation: 0,
                pinned: true,
                //expandedHeight: 50,
                collapsedHeight: 56,
                backgroundColor: Colors.white,
                flexibleSpace: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey)),
                        // ignore: prefer_const_literals_to_create_immutables
                        child: Row(children: [
                          const SizedBox(
                            width: 15,
                          ),
                          const Image(
                            image: AssetImage("assets/icons/svgexport-2.png"),
                            height: 17,
                            width: 17,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text(
                            "Search by Keyword or Product ID",
                            style: TextStyle(fontSize: 11, color: Colors.grey),
                          ),
                          const Spacer(),
                          const VerticalDivider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          const Icon(
                            Icons.mic_none_outlined,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ]),
                      ),
                    ),
                  ],
                )
                //snap: true,
                ),
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Padding(
                        padding: EdgeInsets.only(left: 10, top: 10.0),
                        child: CategoryList()),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image(
                          height: 150,
                          width: double.infinity,
                          image: NetworkImage(
                              "https://firebasestorage.googleapis.com/v0/b/meesho-firebase.appspot.com/o/banners%2Fhome_banner.jpg?alt=media&token=e74838c4-624c-42c5-bb38-01afcce41410")),
                    ),
                    // ignore: prefer_const_constructors
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      padding: const EdgeInsets.fromLTRB(15, 15.0, 10, 15),
                      child: const Text(
                        "Products For You",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              );
            }, childCount: 1)),
            SliverAppBar(
                pinned: true,
                expandedHeight: 50,
                backgroundColor: Colors.white,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Divider(
                        height: 1,
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.sort_by_alpha_rounded,
                                size: 17,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Sort",
                                style: TextStyle(fontSize: 13),
                              )
                            ],
                          ),
                          const VerticalDivider(
                            thickness: 0.5,
                            color: Colors.black26,
                          ),
                          Row(
                            children: const [
                              Text(
                                "Category",
                                style: TextStyle(fontSize: 13),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.keyboard_arrow_down,
                                size: 17,
                              )
                            ],
                          ),
                          const VerticalDivider(
                            thickness: 0.5,
                            color: Colors.black26,
                          ),
                          Row(
                            children: const [
                              Text(
                                "Gender",
                                style: TextStyle(fontSize: 13),
                              ),
                              SizedBox(width: 5),
                              Icon(Icons.keyboard_arrow_down, size: 17),
                            ],
                          ),
                          const VerticalDivider(
                            thickness: 0.5,
                            color: Colors.black26,
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.filter_list_sharp,
                                size: 17,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Filters",
                                style: TextStyle(fontSize: 13),
                              )
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                )
                //snap: true,
                ),
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              return SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    const SizedBox(
                      height: 15,
                    ),
                    productProvider.map.isEmpty && !productProvider.error
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : productProvider.error == true
                            ? Center(
                                child: Text(productProvider.errorMessage),
                              )
                            : ProductListWidget(index: 0)
                  ]));
            }, childCount: 1))
          ],
        ),
      ),
    );
  }
}
