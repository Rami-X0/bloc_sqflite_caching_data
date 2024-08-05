class ProductsResponse {
  final bool success;
  final int totalProducts;
  final String message;
  final int offset;
  final int limit;
  final List<Products> products;

  ProductsResponse(
      {required this.success,
      required this.totalProducts,
      required this.message,
      required this.offset,
      required this.limit,
      required this.products});

  factory ProductsResponse.fromJson(Map<String, dynamic> json) {
    return ProductsResponse(
      success: json['success'],
      totalProducts: json['total_products'],
      message: json['message'],
      offset: json['offset'],
      limit: json['limit'],
      products: List<Products>.from(
        json['products'].map((e) => Products.fromJson(e)),
      ),
    );
  }
}

class Products {
  final int id;
  final double price;
  final String category;
  final String updatedAt;
  final String photoUrl;
  final String name;
  final String description;
  final String createdAt;

  Products({
    required this.id,
    required this.price,
    required this.category,
    required this.updatedAt,
    required this.photoUrl,
    required this.name,
    required this.description,
    required this.createdAt,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'],
      price: json['price'].toDouble(),
      category: json['category'],
      updatedAt: json['updated_at'],
      photoUrl: json['photo_url'],
      name: json['name'],
      description: json['description'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'price': price,
      'category': category,
      'updated_at': updatedAt,
      'photo_url': photoUrl,
      'name': name,
      'description': description,
      'created_at': createdAt,
    };
  }
}
