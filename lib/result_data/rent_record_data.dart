import 'package:flutter/material.dart';
import 'package:shiref_bike/record/rent_record.dart';

class rented_record extends StatelessWidget {
  final rent_recordd k;
  rented_record(this.k);

  final _formkey = GlobalKey<FormState>();

  Widget _notes() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        enabled: false,
        controller: TextEditingController(text: k.get_notes()),
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.lightGreen[500])),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.lightGreen[500]),
            ),
            labelText: 'Notes',
            labelStyle: TextStyle(color: Colors.black, fontSize: 20)),
        maxLines: 2,
        style: TextStyle(
          fontSize: 20,
          color: Colors.grey[700],
        ),
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
            suffixText: 'EGP',
            suffixStyle: TextStyle(
                color: Colors.green, fontWeight: FontWeight.bold, fontSize: 20),
            filled: true,
            fillColor: Colors.white,
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.lightGreen[500])),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.lightGreen[500]),
            ),
            labelText: 'Rent Cost',
            labelStyle: TextStyle(color: Colors.black, fontSize: 20)),
        maxLines: 2,
        style: TextStyle(
          fontSize: 20,
          color: Colors.grey[700],
        ),
      ),
    );
  }

  Widget _status() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        enabled: false,
        controller: TextEditingController(text: k.get_satus().toString()),
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.lightGreen[500])),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.lightGreen[500]),
            ),
            labelText: 'Status',
            labelStyle: TextStyle(color: Colors.black, fontSize: 20)),
        maxLines: 2,
        style: TextStyle(
          fontSize: 20,
          color: Colors.grey[700],
        ),
      ),
    );
  }

  Widget _ends() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        enabled: false,
        controller: TextEditingController(text: k.get_ends()),
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.lightGreen[500])),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.lightGreen[500]),
            ),
            labelText: 'Ends',
            labelStyle: TextStyle(color: Colors.black, fontSize: 20)),
        maxLines: 2,
        style: TextStyle(
          fontSize: 20,
          color: Colors.grey[700],
        ),
      ),
    );
  }

  Widget _bike() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        enabled: false,
        controller: TextEditingController(text: k.get_main_bike().toString()),
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.lightGreen[500])),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.lightGreen[500]),
            ),
            labelText: 'Bike ID',
            labelStyle: TextStyle(color: Colors.black, fontSize: 20)),
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
            filled: true,
            fillColor: Colors.white,
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.lightGreen[500])),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.lightGreen[500]),
            ),
            labelText: 'Customer Data',
            labelStyle: TextStyle(color: Colors.black, fontSize: 20)),
        maxLines: 2,
        style: TextStyle(
          fontSize: 20,
          color: Colors.grey[700],
        ),
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
        style: TextStyle(
            fontSize: 20,
            color: Colors.lightGreen[500],
            fontWeight: FontWeight.bold),
        enabled: false,
        controller: TextEditingController(text: k.get_admin_name()),
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.lightGreen[500])),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.lightGreen[500]),
            ),
            labelText: 'Admin Name',
            labelStyle: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            icon: Icon(
              Icons.person_outline,
              size: 50,
              color: Colors.grey[600],
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
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            title: (Text("Rent")),
            backgroundColor: Colors.grey[800],
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
              //Rent Cost
              Container(
                  height: 70,
                  padding: EdgeInsets.all(2),
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Rent Cost: ",
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
              //Statue
              Container(
                  height: 70,
                  padding: EdgeInsets.all(2),
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Statue: ",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          k.get_satus().toString(),
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  )),

              //Bike Id
              Container(
                  height: 70,
                  padding: EdgeInsets.all(4),
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Bike ID: ",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          k.get_id().toString(),
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  )),

              //ends
              Container(
                  height: 70,
                  padding: EdgeInsets.all(2),
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Ends: ",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "Due " + k.get_ends() + " days",
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
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
          //               _status(),
          //               _bike(),
          //               _ends(),
          //             ],
          //           ))),
          // ),
        ));
  }
}
