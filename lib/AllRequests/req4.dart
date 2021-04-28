import 'package:flutter/material.dart';
import '../signup.dart';

class Request4 extends StatelessWidget {
  const Request4({Key key}) : super(key: key);

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
                  'Location : 124 Senga Nehosho\n\nStatus: InActive\n\nAttendence: Driver (ID: A7P3JDK2) Attended\n\nDate Requested: 11 April 2021\n\nTime: 22.09hrs (GMT 2+)',
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
