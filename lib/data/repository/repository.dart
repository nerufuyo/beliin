import 'dart:convert';

import 'package:beliin/data/model/product_model.dart';
import 'package:beliin/data/model/user_model.dart';
import 'package:flutter/services.dart';

class Repository {
  Future<List<Product>> getAllProducts() async {
    final response =
        await rootBundle.loadString('lib/assets/jsons/product.json');

    try {
      if (response.isNotEmpty) {
        final Map<String, dynamic> data = json.decode(response);
        final List<dynamic> productLists = data['products'];
        return productLists.map((e) => Product.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load product list');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Product> getProductById(int id) async {
    final response =
        await rootBundle.loadString('lib/assets/jsons/product.json');

    try {
      if (response.isNotEmpty) {
        final Map<String, dynamic> data = json.decode(response);
        return Product.fromJson(data['products'][id]);
      } else {
        throw Exception('Failed to load product');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<User?> loginUser({email, password}) async {
    final users = await Repository().getAllUsers();

    User? user;

    for (var i = 0; i < users.length; i++) {
      if (users[i].email == email && users[i].password == password) {
        user = users[i];
      }
    }

    return user;
  }

  Future<List<User>> getAllUsers() async {
    final response = await rootBundle.loadString('lib/assets/jsons/user.json');

    try {
      if (response.isNotEmpty) {
        final Map<String, dynamic> data = json.decode(response);
        final List<dynamic> userLists = data['users'];
        return userLists.map((e) => User.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load user list');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<User> getUserById(int id) async {
    final response = await rootBundle.loadString('lib/assets/jsons/user.json');

    try {
      if (response.isNotEmpty) {
        final Map<String, dynamic> data = json.decode(response);
        return User.fromJson(data['users'][id]);
      } else {
        throw Exception('Failed to load user');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
