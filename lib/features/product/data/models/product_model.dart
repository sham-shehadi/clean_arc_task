import '../../domain/entities/product.dart';

class Productmodel extends Product {
  const Productmodel({required super.title, required super.image, required super.price, required super.description,});

  factory Productmodel.fromJson(Map<String, dynamic> json) {
    return Productmodel(
      title: json['title'],
      image: json['image'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'image': image,
      'price': price,
      'description': description,
    };
  }
}