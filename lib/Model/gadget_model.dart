import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class Gadget {
  final int id;
  final String name;
  final String handler;
  final String description;
  final String category;
  final String price;
  final List<String> images;

  Gadget({
    required this.id,
    required this.name,
    required this.handler,
    required this.description,
    required this.category,
    required this.price,
    required this.images,
  });

  factory Gadget.fromJson(Map<String, dynamic> json) {
    return Gadget(
      id: json['id'] as int,
      name: json['name'] as String,
      handler: json['handler'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      price: json['price'] as String,
      images: List<String>.from(json['images'] as List<dynamic>),
    );
  }
}

final gadgetsProvider = FutureProvider<List<Gadget>>((ref) => fetchGadgets());

Future<List<Gadget>> fetchGadgets() async {
  final String response = await rootBundle.loadString('lib/assets/data/products.json');
  final List<dynamic> data = jsonDecode(response);
  return data.map((json) => Gadget.fromJson(json)).toList();
}


// Future<List<Gadget>> fetchGadgets() async {
//   final response = await http.get(Uri.parse('lib/assets/data/products.json'));
//   if (response.statusCode == 200) {
//     final List<dynamic> data = jsonDecode(response.body);
//     return data.map((json) => Gadget.fromJson(json)).toList();
//   } else {
//     throw Exception('Failed to load gadgets');
//   }
// }