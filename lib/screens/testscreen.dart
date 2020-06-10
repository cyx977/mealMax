import 'package:flutter/material.dart';

var x = [1, 2, 3, 4, 5, 6];

class TestScreen extends StatelessWidget {
  static final route = "/testScreen";
  @override
  Widget build(BuildContext context) {
    print("test build");
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: ListView.builder(
        itemBuilder: (context, index) {
          return Text(
            x[index].toString(),
          );
        },
        itemCount: x.length,
      )),
    );
  }
}
