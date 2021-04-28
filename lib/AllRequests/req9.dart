import 'package:flutter/material.dart';
import '../signup.dart';

class Request9 extends StatelessWidget {
  const Request9({Key key}) : super(key: key);

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
                  'Location : 4255 Senga Nehosho\n\nStatus: InActive\n\nAttendence: Driver (ID: A2P5JDK9) Attended\n\nDate Requested: 25 April 2021\n\nTime: 10.47hrs (GMT 2+)',
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(
                  height: 40.0,
                ),
                RaisedButton(
                    child: Text('Attend Request'),
                    onPressed: () {
                      displayToastMessage("Request expired", context);
                    }),
              ],
            ),
          ),
        ));
  }
}
