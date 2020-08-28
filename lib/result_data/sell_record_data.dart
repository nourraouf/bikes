import 'package:flutter/material.dart';
import 'package:shiref_bike/record/sell_records.dart';

class selled_record extends StatelessWidget {
  final sell_recordd k;
  selled_record(this.k);

  final _formkey = GlobalKey<FormState>();

  Widget _notes() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        enabled: false,
        controller: TextEditingController(text: k.get_notes()),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'notes',
        ),
        maxLines: 2,
      ),
    );
  }

  Widget _price() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        enabled: false,
        controller: TextEditingController(text: k.get_price().toString()),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'price',
        ),
        maxLines: 2,
      ),
    );
  }

  Widget _product() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        enabled: false,
        controller: TextEditingController(text: k.get_product()),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'product',
        ),
        maxLines: 2,
      ),
    );
  }

  Widget _time() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        enabled: false,
        controller:
            TextEditingController(text: k.get_datatime().toIso8601String()),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'datetime',
        ),
        maxLines: 2,
      ),
    );
  }

  Widget _customer_data() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        enabled: false,
        controller: TextEditingController(text: k.get_customer().toString()),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'customer data',
        ),
        maxLines: 2,
      ),
    );
  }

  final idholder = TextEditingController();
  final holder = TextEditingController();
  final rentholder = TextEditingController();
  final priceholder = TextEditingController();

  Widget _admin_name() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        enabled: false,
        controller: TextEditingController(text: k.get_admin_name()),
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'admin name',
            icon: Icon(
              Icons.directions_bike,
              color: Colors.grey[700],
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Navigator.pop(context);
        },
        child: Scaffold(
          appBar: AppBar(
            title: (Text("Sell")),
            backgroundColor: Colors.grey[700],
            leading: new IconButton(
              icon: new Icon(
                Icons.arrow_back,
                color: Colors.lightGreen[500],
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: ListView(
            children: <Widget>[
              //admin name
              Container(
                  height: 70.0,
                  padding: EdgeInsets.all(2),
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Admin Name: ",
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          k.get_admin_name(),
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.lightGreen[500],
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )),
              //customer data
              Container(
                  height: 70.0,
                  padding: EdgeInsets.all(2),
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(2),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Customer Data: ",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                k.get_customer().toString(),
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
              //international id&customer photo
              Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.all(5),
                          width: 190.0,
                          height: 240.0,
                          child: Column(
                            children: [
                              Image.network(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQzQePYsQbM019HHcpdaVH9sZgg5N34C62rSg&usqp=CAU'),
                              Text("Customer Photo")
                            ],
                          )),
                      Container(
                          padding: EdgeInsets.all(5),
                          width: 190.0,
                          height: 240.0,
                          child: Column(
                            children: [
                              Image.network(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQzQePYsQbM019HHcpdaVH9sZgg5N34C62rSg&usqp=CAU'),
                              Text("Customer Intrnational ID")
                            ],
                          )),
                    ],
                  )),

              //Notes
              Container(
                  height: 70,
                  padding: EdgeInsets.all(2),
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Notes: ",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          k.get_notes(),
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  )),

//time
              Container(
                  height: 70,
                  padding: EdgeInsets.all(2),
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Product: ",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          k.get_product(),
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  )),

//price
              Container(
                  height: 70,
                  padding: EdgeInsets.all(2),
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Bike Price: ",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          k.get_price().toString(),
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        )
        // body: Container(
        //   padding: EdgeInsets.all(20),
        //   child: SingleChildScrollView(
        //       child: Form(
        //           key: _formkey,
        //           child: Column(
        //             children: <Widget>[
        //               _admin_name(),
        //               _customer_data(),
        //               _price(),
        //               _notes(),
        //             ],
        //           ))),
        // ),
        );
  }
}
