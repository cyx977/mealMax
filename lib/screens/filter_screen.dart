import 'package:flutter/material.dart';
import 'package:maxMeal/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function saveFilterFunction;
  final Map<String, bool> filters;
  static final String route = "/filterScreen";
  FiltersScreen({
    @required this.saveFilterFunction,
    @required this.filters,
  });
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  void initState() {
    isGlutenFree = widget.filters['isGlutenFree'];
    isVegan = widget.filters['isVegan'];
    isVegeterian = widget.filters['isVegeterian'];
    isLactoseFree = widget.filters['isLactoseFree'];
    super.initState();
  }

  var isGlutenFree;
  var isVegan;
  var isVegeterian;
  var isLactoseFree;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              Map<String, bool> x = {
                "isGlutenFree": isGlutenFree,
                "isVegan": isVegan,
                "isVegeterian": isVegeterian,
                "isLactoseFree": isLactoseFree,
              };
              widget.saveFilterFunction(x);
            },
          )
        ],
      ),
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
                buildSwitchListTile(
                  title: "Gluten Free",
                  value: isGlutenFree,
                  subtitle: "Includes Gluten Free Meals only.",
                  changeHandler: (bool val) {
                    setState(() {
                      isGlutenFree = val;
                    });
                  },
                ),
                buildSwitchListTile(
                  title: "Vegan",
                  value: isVegan,
                  subtitle: "Includes Vegan Meals only.",
                  changeHandler: (bool val) {
                    setState(() {
                      isVegan = val;
                    });
                  },
                ),
                buildSwitchListTile(
                  title: "Vegeterian",
                  value: isVegeterian,
                  subtitle: "Includes Vegeterian Meals only.",
                  changeHandler: (bool val) {
                    setState(() {
                      isVegeterian = val;
                    });
                  },
                ),
                buildSwitchListTile(
                  title: "Lactose Free",
                  value: isLactoseFree,
                  subtitle: "Includes Lactose Free Meals only.",
                  changeHandler: (bool val) {
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

  SwitchListTile buildSwitchListTile({
    @required String title,
    @required String subtitle,
    @required bool value,
    @required Function changeHandler,
  }) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: changeHandler,
    );
  }
}
