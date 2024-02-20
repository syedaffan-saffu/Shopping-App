import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Album {
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;

  const Album({
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      category: json['category'] as String,
      image: json['image'] as String,
    );
  }
}

Future<List<Album>> fetchAlbums() async {
  final response =
      await http.get(Uri.parse('https://fakestoreapi.com/products?limit=20'));

  if (response.statusCode == 200) {
    // Convert the JSON array to a List of Map<String, dynamic>
    final List<dynamic> jsonData = jsonDecode(response.body);

    // Map each element in the list to an Album object
    final List<Album> albums = jsonData
        .map((json) => Album.fromJson(json as Map<String, dynamic>))
        .toList();

    return albums;
  } else {
    throw Exception('Failed to load albums');
  }
}
