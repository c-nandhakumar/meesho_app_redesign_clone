import 'package:flutter/material.dart';
import 'package:meeshoapp/models/products_model.dart';
import 'package:meeshoapp/providers/products_provider.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsScreen extends StatefulWidget {
  ProductList? productList;
  ProductDetailsScreen({this.productList, super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              IconButton(
                  color: Colors.black,
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
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
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 570,
            color: Colors.grey[300],
            width: double.infinity,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  activeIndex = value;
                });
              },
              itemCount: widget.productList!.productImages.length,
              itemBuilder: (context, index) {
                return Image(
                  fit: BoxFit.cover,
                  height: 400,
                  width: double.infinity,
                  image: NetworkImage(widget.productList!.productImages[index]),
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: widget.productList!.productImages.length,
              effect: const SlideEffect(
                  spacing: 8.0,
                  radius: 1.0,
                  dotWidth: 12.0,
                  dotHeight: 3.0,
                  //paintStyle: PaintingStyle.stroke,
                  strokeWidth: 1.5,
                  dotColor: Colors.black26,
                  activeDotColor: Colors.pinkAccent),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  widget.productList!.productTitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontSize: 15, color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  "₹${widget.productList!.productPrice.toString()}",
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
              )
            ]),
            Spacer(),
            Row(
              children: [
                Column(
                  children: [
                    const Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.grey,
                      size: 20,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Wishlist",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 10, color: Colors.grey),
                    )
                  ],
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  children: [
                    const Icon(
                      Icons.share_outlined,
                      color: Colors.grey,
                      size: 20,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Share",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 10, color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              width: 15,
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10),
            child: Row(
              children: [
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
                  width: 5,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.group,
                      color: Colors.grey,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      "3,052 ratings",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 10, color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
          ),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 15,
          ),
          Container(
            height: 10,
            color: Colors.grey.shade200,
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "Select Size",
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: SizedBox(
              height: 35,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 10,
                ),
                itemCount: productProvider.sizeChart.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1.25, color: Colors.black),
                        borderRadius: BorderRadius.circular(20)),
                    height: 20,
                    width: 50,
                    child: Center(
                        child: Text(
                      productProvider.sizeChart[index],
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontWeight: FontWeight.w700),
                    )),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            height: 10,
            color: Colors.grey.shade200,
          ),
          productDetailsContainer(context, widget.productList),
          Container(
            height: 10,
            color: Colors.grey.shade200,
          ),
          productDescriptionContainer(context, widget.productList),
          Container(
            height: 10,
            color: Colors.grey.shade200,
          ),
          addtoCartWidget(context)
        ],
      )),
    );
  }

  productDetailsContainer(context, ProductList? productList) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 125,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Product Details",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Text(
                "COPY",
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 12,
                    color: Colors.pinkAccent,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(top: 3),
            child: Text(
              "Name : ${productList!.productTitle}",
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(fontSize: 12, color: Colors.grey),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 3),
            child: Text(
              "Composition : ${productList.composition}",
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(fontSize: 12, color: Colors.grey),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 3),
            child: Text(
              "Fit : ${productList.fit}",
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(fontSize: 12, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  productDescriptionContainer(BuildContext context, ProductList? productList) {
    return Container(
        padding: const EdgeInsets.all(15),
        height: 120,
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Product Description",
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(top: 3),
            child: Text(
              "${productList!.productDescription}",
              maxLines: 3,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(fontSize: 12, color: Colors.grey, height: 1.5),
            ),
          ),
        ]));
  }

  addtoCartWidget(context) {
    return Container(
      height: 75,
      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Container(
          height: 55,
          width: 170,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1.25),
              borderRadius: BorderRadius.circular(5)),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
              ),
              Text(
                "Add to Cart",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 15),
              ),
            ],
          )),
        ),
        Container(
          height: 55,
          width: 170,
          decoration: BoxDecoration(
              color: Colors.pinkAccent,
              border: Border.all(color: Colors.pinkAccent, width: 1.25),
              borderRadius: BorderRadius.circular(5)),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.chevron_right,
                color: Colors.white,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "Buy Now",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: Colors.white, fontSize: 15),
              ),
            ],
          )),
        )
      ]),
    );
  }
}
