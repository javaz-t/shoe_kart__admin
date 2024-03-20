class ProductDetails {
  final String id;
  final String name;
  final String brand;
  final String description;
  final double price;
  final double discount;
  final double deliveryCharge;
  final List<String> images;
  final List<String> colors;
  final List<String> sizes;
  final List<String> catergory;

  ProductDetails(  {
    required this.id,
    required this.name,
    required this.brand,
    required this.description,
    required this.price,
    required this.discount,
    required this.deliveryCharge,
    required this.images,
    required this.colors,
    required this.sizes,
    required this.catergory,
  });

  // Convert a ShoeDetailsModel instance into a Map (for JSON serialization)
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'brand':brand,
        'description': description,
        'price': price,
        'discount': discount,
        'deliveryCharge': deliveryCharge,
        'images': images,
        'colors': colors,
        'sizes': sizes,
        'catergory': catergory
      };

  // Construct a ShoeDetailsModel from a Map (for JSON deserialization)
  factory ProductDetails.fromJson(Map<String, dynamic> json) {
    return ProductDetails(
      id: json['id'],
      name: json['name'],
      brand: json['brand'],
      description: json['description'],
      price: json['price'],
      discount: json['discount'],
      deliveryCharge: json['deliveryCharge'],
      images: List<String>.from(json['images']),
      colors: List<String>.from(json['colors']),
      sizes: List<String>.from(json['sizes']),
      catergory: List<String>.from(json['catergory']), 
    );
  }
}
