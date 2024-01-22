import 'dart:convert';
import 'package:http/http.dart' as http;

class Product
{
  String name, category, image;
  int id, price;

  Product({
    required this.id,
    required this.category,
    required this.name,
    required this.price,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json)
  {
    return Product(
      id: json['id'],
      category: json['category'],
      name: json['name'],
      price: json['price'],
      image: json['image']
    );
  }
}

List<Product> productFromJson(jsonData)
{
  List<Product> result = List<Product>.from(
    jsonData.map((item) => Product.fromJson(item))
  );

  return result;
}

Future<List<Product>> getProducts() async
{
  final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/product'));

  if(response.statusCode == 200) {
    var jsonResp = json.decode(response.body);
    return productFromJson(jsonResp['products']);
  }
  else {
    throw Exception("Failed load, status: ${response.statusCode}");
  }
}