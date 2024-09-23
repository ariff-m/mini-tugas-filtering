import 'dart:convert';

List<ProductsModel> productsModelFromJson(String str) =>
    List<ProductsModel>.from(
        json.decode(str).map((x) => ProductsModel.fromJson(x)));

String productsModelToJson(List<ProductsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsModel {
  String name;
  int price;
  int stock;
  Category category;

  ProductsModel({
    required this.name,
    required this.price,
    required this.stock,
    required this.category,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        name: json["name"],
        price: json["price"],
        stock: json["stock"],
        category: categoryValues.map[json["category"]]!,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "stock": stock,
        "category": categoryValues.reverse[category]!,
      };
}

enum Category { kebersihan, kebutuhanSehariHari, kesehatan }

final categoryValues = EnumValues({
  "Kebersihan": Category.kebersihan,
  "Kebutuhan Sehari-hari": Category.kebutuhanSehariHari,
  "Kesehatan": Category.kesehatan
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
