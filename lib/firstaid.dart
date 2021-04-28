import 'package:flutter/material.dart';

class FirstAid extends StatefulWidget {
  @override
  _FirstAid createState() => _FirstAid();
}

class _FirstAid extends State<FirstAid> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text("AMBULANCE REQUESTS")));
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
