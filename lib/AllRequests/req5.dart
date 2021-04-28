import 'package:flutter/material.dart';
import '../signup.dart';

class Request5 extends StatelessWidget {
  const Request5({Key key}) : super(key: key);

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
                  'Location : China Hostel F\n\nStatus: InActive\n\nAttendence: Driver (ID: A1P1JDK5) Attended\n\nDate Requested: 15 April 2021\n\nTime: 16.02hrs (GMT 2+)',
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(
                  height: 40.0,
                ),
                RaisedButton(
                    child: Text('Attend Request'),
                    onPressed: () {
                      displayToastMessage("Request Expired", context);
                    }),
              ],
            ),
          ),
        ));
  }
}
