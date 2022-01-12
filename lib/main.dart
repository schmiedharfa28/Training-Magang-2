import 'package:flutter/material.dart';
import 'package:training_2/custome_gridview.dart';
import 'package:training_2/register_form.dart';
import 'package:training_2/searc_listview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenuTab(),
    );
  }
}

class MenuTab extends StatefulWidget {
  @override
  _MenuTabState createState() => _MenuTabState();
}

class _MenuTabState extends State<MenuTab> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: [
          // Container(
          //   color: Colors.lightGreen,
          //   child: Center(
          //     child: Text(
          //       "Custome Grid View",
          //       style: TextStyle(fontSize: 25),
          //     ),
          //   ),
          // ),
          CustomeGridView(),
          // Container(
          //   color: Colors.blueAccent,
          //   child: Center(
          //     child: Text(
          //       "Search View",
          //       style: TextStyle(fontSize: 25),
          //     ),
          //   ),
          // ),
          SearchListView(),
          // Container(
          //   color: Colors.amber,
          //   child: Center(
          //     child: Text(
          //       "Register View",
          //       style: TextStyle(fontSize: 25),
          //     ),
          //   ),
          // ),
          RegisterForm(),
          Container(
            color: Colors.cyan,
            child: Center(
              child: Text(
                "Home Page",
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
        ],
        controller: _tabController,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: TabBar(
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.black,
          tabs: [
            Tab(
              text: 'Custome GridView',
              icon: Icon(
                Icons.grid_on,
                color: Colors.black,
              ),
            ),
            Tab(
              text: 'Search View',
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
            Tab(
              text: 'Register View',
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
            ),
            Tab(
              text: 'Home Page',
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
            ),
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}
