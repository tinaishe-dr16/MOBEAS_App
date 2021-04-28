import 'package:flutter/material.dart';
import '../signup.dart';

class Request10 extends StatelessWidget {
  const Request10({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('MOBEAS Request'),
          backgroundColor: Colors.red[700],
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 40.0,
                ),
                Text(
                  'Location : 1470 KMP Senga Ext.\n\nStatus: Active\n\nAttendence: Driver (ID: A2P5JDK9) Attending\n\nDate Requested: 29 April 2021\n\nTime: 12.56hrs (GMT 2+)',
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(
                  height: 40.0,
                ),
                RaisedButton(
                    child: Text('Attend Request'),
                    onPressed: () {
                      displayToastMessage(
                          "A2P5JDK9 is already attending", context);
                    }),
              ],
            ),
          ),
        ));
  }
}
