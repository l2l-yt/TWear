import 'dart:convert';

class Product {
  final String name;
  final double price;
  final double? discount; // Discount can be nullable
  final List<String> images; // Assuming images are URLs or paths
  final int stock;
  final String details;
  final String delivery; // Delivery details, e.g., "2-3 days"
  final String company;
  final String category;

  Product({
    required this.name,
    required this.price,
    this.discount,
    required this.images,
    required this.stock,
    required this.details,
    required this.delivery,
    required this.company,
    required this.category,
  });

  // Convert Product to Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'discount': discount,
      'images': images,
      'stock': stock,
      'details': details,
      'delivery': delivery,
      'company': company,
      'category': category,
    };
  }

  // Create Product from Map
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] as String,
      price: map['price'] as double,
      discount: map['discount'] as double?,
      images: List<String>.from(map['images']),
      stock: map['stock'] as int,
      details: map['details'] as String,
      delivery: map['delivery'] as String,
      company: map['company'] as String,
      category: map['category'] as String,
    );
  }

  // Convert Product to JSON
  String toJson() => json.encode(toMap());

  // Create Product from JSON
  factory Product.fromJson(String source) => Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(name: $name, price: $price, discount: $discount, images: $images, stock: $stock, details: $details, delivery: $delivery, company: $company, category: $category)';
  }

  // Override equals operator
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.name == name &&
        other.price == price &&
        other.discount == discount &&
        other.images == images &&
        other.stock == stock &&
        other.details == details &&
        other.delivery == delivery &&
        other.company == company &&
        other.category == category;
  }

  // Override hashCode
  @override
  int get hashCode {
    return name.hashCode ^
        price.hashCode ^
        discount.hashCode ^
        images.hashCode ^
        stock.hashCode ^
        details.hashCode ^
        delivery.hashCode ^
        company.hashCode ^
        category.hashCode;
  }
}
