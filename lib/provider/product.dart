import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:state_management/models/http_exception.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.imageUrl,
      this.isFavorite = false});

  Future<void> toggleFavorite(String authToken, String userId) async {
    final oldState = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    final url = Uri.parse(
        'https://flutter-update-29243-default-rtdb.firebaseio.com/userFavorites/$userId/$id.json?auth=$authToken');
    final response = await http.put(
      url,
      body: json.encode(
        isFavorite,
      ),
    );
    try {
      if (response.statusCode >= 400) {
        throw HttpException('Err in favorite status');
      }
    } catch (err) {
      isFavorite = oldState;
      notifyListeners();
    }
  }
}
