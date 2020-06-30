import 'package:flutter/material.dart';
import 'package:shiref_bike/add_types/add_service.dart';
import 'package:shiref_bike/add_types/add_user.dart';
import 'package:shiref_bike/widgets/shared.dart';

import '../main.dart';

class add extends StatefulWidget {
  @override
  _addState createState() => _addState();
}

class _addState extends State<add> {
  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: Text("NO"),
              ),
              SizedBox(height: 16),
              new GestureDetector(
                onTap: () => Navigator.of(context).pop(true),
                child: Text("YES"),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Container(
        child: Scaffold(
          appBar: appBar('Add'),
          body: ListView(
            padding: EdgeInsets.all(32),
            children: <Widget>[
              RaisedButton(
                  color: Colors.blue,
                  child: Text('Add Customer'),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return add_user();
                    }));
                  }),
              RaisedButton(
                  color: Colors.blue,
                  child: Text('Add Service'),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return add_service();
                    }));
                  }),
              RaisedButton(
                  color: Colors.blue,
                  child: Text('Add product'),
                  onPressed: null),
            ],
          ),
        ),
      ),
    );
  }
}
