import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favourite_screen.dart';

class MyHomePage extends StatefulWidget {
  static final route = "/";
  MyHomePage({this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String,dynamic>> _pages = [
    {'page': CategoriesScreen(), 'title' : "Categories"},
    {'page': FavouriteScreen(), 'title': "Your Favourites"}
  ];
  int _selectedIndex = 0;
  TabController tabController;
  @override
  Widget build(BuildContext context) {
    print("homepagebuild");
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
            ),
            onPressed: () {

            },
          )
        ],
        title: Text(_pages[_selectedIndex]['title']),
      ),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pink,
        // type: BottomNavigationBarType.fixed, //default
        // type: BottomNavigationBarType.shifting
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.black38,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text("Favourites"),
          )
        ],
      ),
    );
  }
}
