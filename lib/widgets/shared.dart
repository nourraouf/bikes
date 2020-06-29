import 'package:flutter/material.dart';

AppBar appBar(String title) {
  return AppBar(
    backgroundColor: Colors.grey[700],
    leading: Icon(Icons.directions_bike),
    title: Text(
      '$title',
    ),
  );
}
