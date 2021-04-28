import 'package:flutter/material.dart';
import 'AllRequests/req10.dart';
import 'AllRequests/req4.dart';
import 'AllRequests/req5.dart';
import 'AllRequests/req6.dart';
import 'AllRequests/req7.dart';
import 'AllRequests/req8.dart';
import 'AllRequests/req9.dart';

class Attended extends StatelessWidget {
  const Attended({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Attended Requests'),
        backgroundColor: Colors.red[700],
      ),
      body: Container(
        child: ListView(
          children: [
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
                title: Text('3. 321 CABS near Telone Campus(Attended)'),
                hoverColor: Colors.grey,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Request6())),
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
                title: Text('4. 4660 KMP Senga (Attended)'),
                hoverColor: Colors.grey,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Request7())),
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
                title: Text('5. Japan Hostel W (Attended)'),
                hoverColor: Colors.grey,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Request8())),
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
                title: Text('6. 4255 Senga Nehosho (Attended)'),
                hoverColor: Colors.grey,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Request9())),
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
                title: Text('7. Fletcher High School Staff Cottage (Attended)'),
                hoverColor: Colors.grey,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Request10())),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
