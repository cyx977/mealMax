import 'package:flutter/material.dart';
import 'package:maxMeal/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static final String route = "/filterScreen";
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var isGlutenFree = false;
  var isVegan = false;
  var isVegeterian = false;
  var isLactoseFree = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Adjust your meal selection",
                style: Theme.of(context).textTheme.headline6),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  title: Text("Gluten Free"),
                  value: isGlutenFree,
                  onChanged: (bool val) {
                    setState(() {
                      isGlutenFree = val;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text("Vegan"),
                  value: isVegan,
                  onChanged: (bool val) {
                    setState(() {
                      isVegan = val;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text("Vegeterian"),
                  value: isVegeterian,
                  onChanged: (bool val) {
                    setState(() {
                      isVegeterian = val;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text("Lactose Free"),
                  value: isLactoseFree,
                  onChanged: (bool val) {
                    setState(() {
                      isLactoseFree = val;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
