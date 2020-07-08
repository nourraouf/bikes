import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shiref_bike/pages/add.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class add_bike extends StatefulWidget {
  @override
  _add_bikeState createState() => _add_bikeState();
}

class _add_bikeState extends State<add_bike> {
  final _formkey = GlobalKey<FormState>();
  String _name_product, _descripto, _product_cost, _rent_cost;
  File _image;

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
  final rentholder = TextEditingController();
  final priceholder = TextEditingController();

  clearTextInput() {
    idholder.clear();
    holder.clear();
    rentholder.clear();
    priceholder.clear();
  }

  Widget _productname() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: idholder,
        onSaved: (val) => _name_product = val,
        // keyboardType: TextInputType.number,
        // validator: (val) => val.length > 3 ? 'Enter correct ID number' : null,
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
        controller: rentholder,
        onSaved: (val) => _rent_cost = val,
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
      _upload(_image);

      // print('id:$_service_name ');
    } else {
      print('not !');
    }
  }

  Widget _camera() {
    return ButtonBar(
      children: [
        IconButton(
          icon: Icon(Icons.camera_enhance),
          onPressed: () async => await getImage(),
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

  Future getImage() async {
    // ignore: deprecated_member_use
    var image = await ImagePicker.pickImage(
        source: ImageSource.camera,
        imageQuality: 50, // <- Reduce Image quality
        maxHeight: 500, // <- reduce the image size
        maxWidth: 500);
    setState(() {
      this._image = File(image.path);
    });
  }
  // String _name_product, _descripto, _product_cost,_rent_cost;

  void _upload(File file) async {
    final prefs = await SharedPreferences.getInstance();

    final token = prefs.getString('token') ?? 0;
    final admin = prefs.getString('admin') ?? 0;
    print(admin);
    String fileName = file.path.split('/').last;

    FormData data = FormData.fromMap({
      // "image": await MultipartFile.fromFile(
      //file.path,

      // ),

      "admin": admin,

      "model": _name_product,
      "serial": "000",
      "image": "http://hassanharby2000.pythonanywhere.com/media/Untitled.png",
      "availability": true,
      "rentability": _switchVal,
      "availabilityDuration": "00:00:02",
      "description": _descripto,
      "sellPrice": _product_cost,
      "rentPerDay": 1,
      "rentPerWeek": 1,
      "rentPerMonth": _rent_cost,
      "branche": 1,
    });

    Dio dio = new Dio();
    // dio.options.headers["Authorization"] = "token $token";
    dio.options.headers["Content-Type"] = "application/json";

    dio
        .post("http://hassanharby2000.pythonanywhere.com/Products/Bike/",
            data: data)
        .then((response) => print(response))
        .catchError((error) => print(error));
  }
/* 
  uploadFile() async {
    var postUri =
        Uri.parse("http://hassanharby2000.pythonanywhere.com/Products/Bike/");
    var request = new http.MultipartRequest("POST", postUri);
    request.fields['user'] = 'blah';
    request.files.add(new http.MultipartFile.fromBytes(
        'file', await File.fromUri(_image.path).readAsBytes(),
        contentType: new MediaType('image', 'jpeg')));

    request.send().then((response) {
      if (response.statusCode == 200) print("Uploaded!");
    });
  } */

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
