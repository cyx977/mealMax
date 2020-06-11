import 'package:flutter/material.dart';
import './categories_screen.dart';
import '../screens/favourite_screen.dart';

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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(
                Icons.settings,
              ),
              onPressed: () {},
            )
          ],
          title: Text(widget.title),
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey[300],
            tabs: [
              Tab(
                icon: Icon(
                  Icons.grid_on,
                ),
                text: "Categories",
              ),
              Tab(
                icon: Icon(Icons.beenhere),
                text: "Favourites",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoriesScreen(),
            FavouriteScreen(),
          ],
        ),
      ),
    );
  }
}
