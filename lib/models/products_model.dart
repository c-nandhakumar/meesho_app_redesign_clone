import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  Products({
    required this.products,
  });

  List<Product> products;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    this.productCategoryId = 0,
    this.category = "",
    this.clothing = "",
    this.categoryImg = "",
    this.productList = const [],
  });

  int productCategoryId;
  String category;
  String clothing;
  String categoryImg;
  List<ProductList> productList;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productCategoryId: json["productCategoryId"],
        category: json["category"],
        clothing: json["clothing"],
        categoryImg: json["categoryImg"],
        productList: List<ProductList>.from(
            json["productList"].map((x) => ProductList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "productCategoryId": productCategoryId,
        "category": category,
        "clothing": clothing,
        "categoryImg": categoryImg,
        "productList": List<dynamic>.from(productList.map((x) => x.toJson())),
      };
}

class ProductList {
  ProductList({
    this.productImages = const [],
    this.productId = "",
    this.productTitle = "",
    this.productDescription = "",
    this.productPrice = 0,
    this.fit = Fit.FITTED,
    this.composition = "",
  });

  List<String> productImages;
  String productId;
  String productTitle;
  String productDescription;
  double productPrice;
  Fit fit;
  String composition;

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
        productImages: List<String>.from(json["productImages"].map((x) => x)),
        productId: json["productId"],
        productTitle: json["productTitle"],
        productDescription: json["productDescription"],
        productPrice: json["productPrice"],
        fit: fitValues.map[json["fit"]] as Fit,
        composition: json["composition"],
      );

  Map<String, dynamic> toJson() => {
        "productImages": List<dynamic>.from(productImages.map((x) => x)),
        "productId": productId,
        "productTitle": productTitle,
        "productDescription": productDescription,
        "productPrice": productPrice,
        "fit": fitValues.reverse[fit],
        "composition": composition,
      };
}

enum Fit { RELAXED_FIT, FITTED, OVERSIZED }

final fitValues = EnumValues({
  "Fitted": Fit.FITTED,
  "Oversized": Fit.OVERSIZED,
  "Relaxed Fit": Fit.RELAXED_FIT
});

class EnumValues<T> {
  late Map<String, T> map;
  Map<T, String> reverseMap = {};

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
