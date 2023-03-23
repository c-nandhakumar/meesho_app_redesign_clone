import 'package:flutter/material.dart';
import 'package:meeshoapp/providers/products_provider.dart';
import 'package:meeshoapp/screens/productlist_screen.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return productProvider.map.isEmpty && !productProvider.error
        ? Container(
            height: 80,
            child: const Center(
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: Colors.pinkAccent,
                ),
              ),
            ),
          )
        : productProvider.error == true
            ? Container(
                height: 80,
                child: Center(
                  child: Text(productProvider.errorMessage),
                ),
              )
            : Container(
                height: 80,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: productProvider.products.products.length,
                  itemBuilder: (context, index) {
                    String categoryImgUrl =
                        productProvider.products.products[index].categoryImg;
                    String category =
                        productProvider.products.products[index].category;
                    return Container(
                      height: 75,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: InkWell(
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return ProductListScreen(
                                index: index,
                              );
                            },
                          ));
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100)),
                              child: categoryImgUrl.isEmpty
                                  ? Text(
                                      "New",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                              color: Colors.pinkAccent,
                                              fontWeight: FontWeight.bold),
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(categoryImgUrl))),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Flexible(
                                child: Text(
                              category,
                              style: const TextStyle(fontSize: 10),
                            ))
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 20,
                  ),
                ),
              );
  }
}
