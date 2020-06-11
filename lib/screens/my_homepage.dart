import 'package:flutter/material.dart';
import './categories_screen.dart';

class MyHomePage extends StatefulWidget {
  static final route = "/";
  MyHomePage({this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TabController tabController;
  @override
  Widget build(BuildContext context) {
    print("homepagebuild");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Text(
        'Navigation Time!',
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, CategoriesScreen.route),
      ),
    );
  }
}
