import 'package:beliin/data/repository/repository.dart';
import 'package:beliin/presentations/screens/home_screen.dart';
import 'package:flutter/material.dart';

void loginFunction(
  context, {
  email,
  password,
}) async {
  final response = await Repository().loginUser(
    email: email,
    password: password,
  );

  if (response == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Email atau Password salah'),
      ),
    );
  } else {
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }
}
