import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  static String route = "/error";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ops not a comfortable place",
        ),
      ),
      body: Center(
        child: Text("Something went Wrong!!"),
      ),
    );
  }
}
