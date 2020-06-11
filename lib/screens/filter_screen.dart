import 'package:flutter/material.dart';
import 'package:maxMeal/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static final String route = "/filterScreen";
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(),
    );
  }
}
