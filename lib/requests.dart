import 'package:MOBEAS/attended.dart';
import 'package:flutter/material.dart';

import 'AllRequests/req1.dart';
import 'AllRequests/req2.dart';
import 'AllRequests/req3.dart';
import 'AllRequests/req4.dart';
import 'AllRequests/req5.dart';
import 'AllRequests/req6.dart';
import 'nomorereqs.dart';

class Requests extends StatefulWidget {
  @override
  _Requests createState() => _Requests();
}

class _Requests extends State<Requests> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: ListView(
          padding: EdgeInsets.all(24),
          children: [
            Text(
              'Ambulance Requests (1):',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
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
                color: Colors.white,
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
                  '3. 961 Boarding House Emergency (Unattended)',
                  style: TextStyle(
                      backgroundColor: Colors.red, color: Colors.white),
                ),
                hoverColor: Colors.grey,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Request3())),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
                child: Text('View More'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NoMoreReqs()));
                }),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Attended Emergencies:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
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
                title: Text('1. 124 Senga Nehosho (Attended)'),
                hoverColor: Colors.grey,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Request4())),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
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
                title: Text('2. China Hostel F (Attended)'),
                hoverColor: Colors.grey,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Request5())),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
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
                    Text('3. 321 CABS near Telone Campus Emergency (Attended)'),
                hoverColor: Colors.grey,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Request6())),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
                child: Text('View All'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Attended()));
                }),
          ],
        )
        // child: Text(
        //   "AMBULANCE REQUESTS",
        ); // ));
  }
}

// Positioned(
//   bottom: 50,
//   right: 10,
//   child: FlatButton(
//     child: Icon(Icons.pin_drop, color: Colors.white),
//     color: Colors.red,
//     onPressed: _addMarker,
//   )
// );

// _addMarker (){
//   var marker = MarkerOptions(position:mapController.cameraPosition.target,
//   icon: BitmapDescriptor.defaultMarker,
//   infoWindowText: InfoWindowText('You are here'),);
//   mapController.addMarker(marker);
// }
