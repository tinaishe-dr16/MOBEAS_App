import 'package:flutter/material.dart';
import '../signup.dart';

class Request2 extends StatelessWidget {
  const Request2({Key key}) : super(key: key);

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
                  'Location : 230 Senga Area 2\n\nStatus: Active\n\nAttendence: Driver (ID: A1P1JDK5) Attending\n\nDate Requested: 29 April 2021\n\nTime: 14.15hrs (GMT 2+)',
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(
                  height: 40.0,
                ),
                RaisedButton(
                    child: Text('Attend Request'),
                    onPressed: () {
                      displayToastMessage(
                          "Driver (A1P1JDK5) is already attending", context);
                    }),
              ],
            ),
          ),
        ));
  }
}
