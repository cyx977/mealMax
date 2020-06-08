import 'dart:ui';

import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String id;
  final Color color;

  CategoryItem({
    this.title,
    this.id,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20),
            ),
            Expanded(
              child: SizedBox(),
            ),
            RaisedButton(
              
              color: Colors.lightBlueAccent.withOpacity(0.2),
              onPressed: () {},
              child: Text("Order Now"),
            )
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,

            colors: [
              color.withOpacity(0.6),
              color,
            ],
          ),
        ),
      ),
    );
  }
}
