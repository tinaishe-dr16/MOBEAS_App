import 'package:flutter/material.dart';

import 'AllRequests/req1.dart';
import 'AllRequests/req2.dart';
import 'AllRequests/req3.dart';

class NoMoreReqs extends StatelessWidget {
  const NoMoreReqs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('MOBEAS Active Requests'),
          backgroundColor: Colors.red[700],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(children: [
            SizedBox(
              height: 40.0,
            ),
            Text(
              'Unattended Requests (1):',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[300],
                      blurRadius: 3,
                      spreadRadius: 2,
                      offset: Offset(0, 2))
                ],
              ),
              child: ListTile(
                title: Text(
                  ' 961 Boarding House Emergency (Unattended)',
                  style: TextStyle(
                      backgroundColor: Colors.red, color: Colors.white),
                ),
                hoverColor: Colors.grey,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Request3())),
              ),
            ),
            SizedBox(
              height: 70.0,
            ),
            Text(
              'Active Requests:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[300],
                      blurRadius: 3,
                      spreadRadius: 2,
                      offset: Offset(0, 2))
                ],
              ),
              child: ListTile(
                title: Text('1. 1470 KMP Emergency (A2P5JDK9 attending)'),
                hoverColor: Colors.grey,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Request1())),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[300],
                      blurRadius: 3,
                      spreadRadius: 2,
                      offset: Offset(0, 2))
                ],
              ),
              child: ListTile(
                title:
                    Text('2. 230 Senga Area 2 Emergency (A1P1JDK5 attending)'),
                hoverColor: Colors.grey,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Request2())),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 10.0,
            ),
          ]),
        ));
  }
}
