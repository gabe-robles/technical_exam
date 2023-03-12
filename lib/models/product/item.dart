class ProductItem {
  const ProductItem({
    required this.id,
    required this.title,
    required this.price,
    required this.imgThumbnail,
    required this.stock,
    required this.discountPercentage,
  });

  final int id;
  final String title;
  final double price;
  final String imgThumbnail;
  final int stock;
  final double discountPercentage;

  factory ProductItem.fromJson(Map<String, dynamic> json) {
    return ProductItem(
      id: json["id"] as int,
      title: json ["title"] as String,
      price: json["price"].toDouble(),
      imgThumbnail: json["thumbnail"] as String,
      stock: json["stock"] as int,
      discountPercentage: json["discountPercentage"].toDouble(),
    );
  }
}
