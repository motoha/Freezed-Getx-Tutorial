// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

List<CategoryTab> categoryFromJson(String str) => List<CategoryTab>.from(
    json.decode(str).map((x) => CategoryTab.fromJson(x)));

String categoryToJson(List<CategoryTab> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryTab {
  String categoryName;
  List<Item> items;

  CategoryTab({
    required this.categoryName,
    required this.items,
  });

  factory CategoryTab.fromJson(Map<String, dynamic> json) => CategoryTab(
        categoryName: json["categoryName"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categoryName": categoryName,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  String name;

  Item({
    required this.name,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
