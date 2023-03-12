class ProductDetails {
  const ProductDetails({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.imgThumbnail,
    required this.images,
  });

  final int id;
  final String title;
  final String description;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final String imgThumbnail;
  final List<String> images;

  factory ProductDetails.fromJson(Map<String, dynamic> json) {
    return ProductDetails(
      id: json["id"] as int,
      title: json ["title"] as String,
      description: json["description"] as String,
      price: json["price"].toDouble(),
      discountPercentage: json["discountPercentage"].toDouble(),
      rating: json["rating"].toDouble(),
      stock: json["stock"] as int,
      brand: json["brand"] as String,
      category: json["category"] as String,
      imgThumbnail: json["thumbnail"] as String,
      images: (json["images"] as List).map((dynamic url)=> url.toString()).toList(),
    );
  }
}
