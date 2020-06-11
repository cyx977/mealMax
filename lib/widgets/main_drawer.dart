import 'package:flutter/material.dart';
import '../screens/filter_screen.dart';
import '../screens/my_homepage.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              width: double.infinity,
              height: 120,
              color: Theme.of(context).accentColor,
              child: Text(
                "Cooking Up!!",
                style: TextStyle(
                  fontSize: 29,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            buildListTile(
              icon: Icons.restaurant,
              title: "Meals",
              tapHandler: () {
                Navigator.of(context).pushReplacementNamed(MyHomePage.route);
              },
            ),
            buildListTile(
              icon: Icons.settings,
              title: "Filters",
              tapHandler: () {
                Navigator.of(context).pushReplacementNamed(FiltersScreen.route);

              },
            ),
          ],
        ),
      ),
    );
  }

  ListTile buildListTile(
      {@required IconData icon,
      @required String title,
      @required Function tapHandler}) {
    return ListTile(
      onTap: tapHandler,
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
