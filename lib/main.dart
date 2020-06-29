import 'package:flutter/material.dart';
import 'package:shiref_bike/pages/actions.dart';
import 'package:shiref_bike/pages/add.dart';
import 'package:shiref_bike/pages/home.dart';
import 'package:shiref_bike/pages/records.dart';
import 'package:shiref_bike/pages/search.dart';
import 'package:shiref_bike/widgets/shared.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.redAccent,
      home: DefaultTabController(
        length: 5,
        child: new Scaffold(
          body: TabBarView(
            children: [
              home(),
              add(),
              search(),
              actions(),
              records(),
            ],
          ),
          bottomNavigationBar: new TabBar(
            tabs: [
              Tab(
                icon: new Icon(Icons.home),
              ),
              Tab(
                icon: new Icon(Icons.add_box),
              ),
              Tab(
                icon: new Icon(Icons.perm_identity),
              ),
              Tab(
                icon: new Icon(Icons.account_balance_wallet),
              ),
              Tab(
                icon: new Icon(Icons.security),
              )
            ],
            labelColor: Colors.red,
            unselectedLabelColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Colors.red,
          ),
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}
