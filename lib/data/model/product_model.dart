class Product {
  final int id;
  final String name;
  final List<String> size;
  final String category;
  final List<String> color;
  final String description;
  final int stock;
  final int priceIdr;
  final String image;
  final double rating;
  final List<Customer> customers;

  Product({
    required this.id,
    required this.name,
    required this.size,
    required this.category,
    required this.color,
    required this.description,
    required this.stock,
    required this.priceIdr,
    required this.image,
    required this.rating,
    required this.customers,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        size: List<String>.from(json["size"].map((x) => x)),
        category: json["category"],
        color: List<String>.from(json["color"].map((x) => x)),
        description: json["description"],
        stock: json["stock"],
        priceIdr: json["price_idr"],
        image: json["image"],
        rating: json["rating"]?.toDouble(),
        customers: List<Customer>.from(
            json["customers"].map((x) => Customer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "size": List<dynamic>.from(size.map((x) => x)),
        "category": category,
        "color": List<dynamic>.from(color.map((x) => x)),
        "description": description,
        "stock": stock,
        "price_idr": priceIdr,
        "image": image,
        "rating": rating,
        "customers": List<dynamic>.from(customers.map((x) => x.toJson())),
      };
}

class Customer {
  final String name;
  final String review;
  final int rate;

  Customer({
    required this.name,
    required this.review,
    required this.rate,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        name: json["name"],
        review: json["review"],
        rate: json["rate"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "review": review,
        "rate": rate,
      };
}
