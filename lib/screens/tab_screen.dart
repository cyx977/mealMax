import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  static final String route = "/";
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 2,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tab Test"),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "tab1",
                icon: Icon(
                  Icons.category,
                  color: Theme.of(context).accentColor,
                ),
                // child: Text("tab1"),
              ),
              Tab(
                icon: Icon(
                  Icons.av_timer,
                  color: Theme.of(context).accentColor,
                ),
                child: Text("tab2"),
              ),
              GestureDetector(
                onTap: (){
                  print("test");
                },
                child: Tab(
                  icon: Icon(
                    Icons.touch_app,
                    color: Theme.of(context).accentColor,
                  ),
                  child: Text("tab3"),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TabTest1(),
            TabTest2(),
            TabTest3(),
          ],
        ),
      ),
    );
  }
}

class TabTest1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("build init1");
    return Text("tab1");
  }
}

class TabTest2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("build init2");
    return Text("tab2");
  }
}

class TabTest3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("build init3");
    return Text("tab3");
  }
}
