import 'package:flutter/material.dart';
import 'package:shiref_bike/record/fix_record.dart';
import 'package:shiref_bike/record/rent_record.dart';
import 'package:shiref_bike/record/sell_records.dart';
import 'package:shiref_bike/result_data/fix_record_data.dart';
import 'package:shiref_bike/result_data/rent_record_data.dart';
import 'package:shiref_bike/result_data/sell_record_data.dart';

class state_record extends StatelessWidget {
  fix_record fix = new fix_record();
  sell_record sell = new sell_record();
  rent_record rent = new rent_record();
  int dlag = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          //To insert a listview inside a column,wrap with an Expanded widget
          // to give column an unbounded height for the listview
          Expanded(
            child: ListView.builder(
              itemCount: rent.rent_records.length +
                  sell.sell_records.length +
                  fix.fix_records.length,
              itemBuilder: (BuildContext context, int index) {
                if (index < rent.rent_records.length) {
                  return ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) =>
                                    rented_record(rent.rent_records[index])));
                      },
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(rent.rent_records[index].get_admin_name()),
                          Text(rent.rent_records[index]
                              .get_customer()
                              .toString()),
                          Divider(
                            thickness: 10,
                          ),
                        ],
                      ));
                } else if (index >= rent.rent_records.length &&
                    index <
                        rent.rent_records.length + sell.sell_records.length) {
                  return ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => selled_record(
                                    sell.sell_records[
                                        index - rent.rent_records.length])));
                      },
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(sell
                              .sell_records[index - rent.rent_records.length]
                              .get_admin_name()),
                          Text(sell
                              .sell_records[index - rent.rent_records.length]
                              .get_customer()
                              .toString()),
                          Divider(
                            thickness: 10,
                          )
                        ],
                      ));
                } else if (index >=
                        rent.rent_records.length + sell.sell_records.length &&
                    index <
                        rent.rent_records.length +
                            sell.sell_records.length +
                            fix.fix_records.length) {
                  return ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => fixed_record(
                                    fix.fix_records[index -
                                        sell.sell_records.length -
                                        rent.rent_records.length])));
                      },
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(fix.fix_records[index -
                                  sell.sell_records.length -
                                  rent.rent_records.length]
                              .get_admin_name()),
                          Text(fix.fix_records[index -
                                  sell.sell_records.length -
                                  rent.rent_records.length]
                              .get_customer()
                              .toString()),
                          Divider(
                            thickness: 10,
                          )
                        ],
                      ));
                }
                dlag = 1;
              },
            ),
          ),
        ],
      ),
    );
  }
}
