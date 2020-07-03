import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shiref_bike/pages/add.dart';

import '../main.dart';

class add_bike extends StatefulWidget {
  @override
  _add_bikeState createState() => _add_bikeState();
}

class _add_bikeState extends State<add_bike> {
  final _formkey = GlobalKey<FormState>();
  String _name_product, _descripto, _product_cost;

  Widget _textT() {
    return Text(
      'Add Product',
      style: TextStyle(
          color: Colors.grey[700], fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _description() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        onSaved: (newValue) => _descripto = newValue,
        controller: holder,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'discription',
        ),
        maxLines: 2,
      ),
    );
  }

  final idholder = TextEditingController();
  final holder = TextEditingController();

  clearTextInput() {
    idholder.clear();
    holder.clear();
  }

  Widget _productname() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: idholder,
        onSaved: (val) => _name_product = val,
        // keyboardType: TextInputType.number,
        validator: (val) => val.length > 3 ? 'Enter correct ID number' : null,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Bike Model',
            hintText: 'ex. cycle pro , trinx ',
            icon: Icon(
              Icons.directions_bike,
              color: Colors.grey[700],
            )),
      ),
    );
  }

  final priceholder = TextEditingController();

  Widget _priceinput() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: priceholder,
        onSaved: (val) => _product_cost = val,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            suffixText: 'EGP',
            suffixStyle: TextStyle(color: Colors.green),
            border: OutlineInputBorder(),
            labelText: 'Product Cost',
            hintText: 'price will be displayed in site !  ',
            icon: Icon(
              Icons.attach_money,
              color: Colors.grey[700],
            )),
      ),
    );
  }

  Widget _rentprice() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: priceholder,
        onSaved: (val) => _product_cost = val,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            enabled: !_isEnabled,
            filled: _isEnabled,
            suffixText: 'EGP',
            suffixStyle: TextStyle(color: Colors.green),
            border: OutlineInputBorder(),
            labelText: 'Rent Cost',
            hintText: 'Rent per month',
            icon: Icon(
              Icons.attach_money,
              color: Colors.grey[700],
            )),
      ),
    );
  }

  Widget _submitbtn() {
    return Center(
      child: RaisedButton(
        color: Colors.blueAccent,
        child: Text(
          "Add",
        ),
        onPressed: () {
          _submit();
        },
      ),
    );
  }

  void _submit() {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      clearTextInput();

      // print('id:$_service_name ');
    } else {
      print('not !');
    }
  }

  File _image;
  final _picker = ImagePicker();

  Future<Null> _pickimagecamera() async {
    final PickedFile fileiamge =
        await _picker.getImage(source: ImageSource.camera);

    setState(() {
      this._image = File(fileiamge.path);
    });
  }

  Widget _camera() {
    return ButtonBar(
      children: [
        IconButton(
          icon: Icon(Icons.camera_enhance),
          onPressed: () async => await _pickimagecamera(),
          tooltip: 'shoot picture',
        )
      ],
    );
  }

  bool _switchVal = false;
  bool _isEnabled = false;

  Widget _switch() {
    return Row(
      children: [
        Text('Rentable'),
        Center(
          child: Switch(
              value: this._switchVal,
              onChanged: (bool value) {
                setState(() {
                  this._switchVal = value;
                  this._isEnabled = !this._isEnabled;
                });
              }),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
            child: Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    _textT(),
                    _productname(),
                    _switch(),
                    _camera(),
                    _priceinput(),
                    _rentprice(),
                    _description(),
                    _submitbtn(),
                  ],
                ))),
      ),
    );
  }
}
