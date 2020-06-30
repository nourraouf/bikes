import 'package:flutter/material.dart';

class findkey extends InheritedWidget {
  const findkey({
    Key key,
    @required this.formkey,
    this.holder,
    this.idholder,
    @required Widget child,
  })  : assert(formkey != null),
        assert(child != null),
        super(key: key, child: child);

  final formkey;
  final idholder;
  final holder;

  static findkey of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<findkey>();
  }

  @override
  bool updateShouldNotify(findkey old) => formkey != old.formkey;
}
