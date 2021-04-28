import 'dart:ui';

import 'package:MOBEAS/destinations.dart';
import 'package:flutter/material.dart';
import '../signup.dart';

class Request3 extends StatelessWidget {
  const Request3({Key key}) : super(key: key);

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
                  'Location : 961 Boarding House\n\nStatus: Active\n\nAttendence: Unattended                                                      \n\nDate Requested: 29 April 2021\n\nTime: 14.30hrs (GMT 2+)',
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(
                  height: 40.0,
                ),
                RaisedButton(
                    color: Colors.redAccent,
                    child: Text(
                      'Attend Request',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MapView()));
                    }),
              ],
            ),
          ),
        ));
  }
}
