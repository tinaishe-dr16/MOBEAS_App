import 'package:flutter/material.dart';
// import 'destinations.dart';

class Settings extends StatefulWidget {
  @override
  _Settings createState() => _Settings();
}

class _Settings extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Column();
  }
}

// import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:geoflutterfire/geoflutterfire.dart';

// class Settings extends StatelessWidget {
//   // Firestore firestore = Firestore.instance;
//   // Geoflutterfire geo = Geoflutterfire();

//   // Future<DocumentReference> _addGeoPoint() async {
//   //   var pos = await location.getLocation();
//   //   GeoFirePoint point =
//   //       geo.point(latitude: pos.latitude, longitude: pos.longitude);
//   //   return firestore
//   //       .collection('locations')
//   //       .add({'position': point.data, 'name': 'Yay I can be queried!'});
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(centerTitle: true, title: Text('Firestore')),
//       // body: _buildBody(context),
//     );
//   }

// //   Widget _buildBody(BuildContext context) {
// //     return StreamBuilder<QuerySnapshot>(
// //       stream: firestore.collection('ambulance_requests').snapshots(),
// //       builder: (context, snapshot) {
// //         if (!snapshot.hasData) return LinearProgressIndicator();

// //         return _buildList(context, snapshot.data.documents);
// //       },
// //     );
// //   }

// //   Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
// //     return ListView(
// //       padding: const EdgeInsets.only(top: 20.0),
// //       children: snapshot.map((data) => _buildListItem(context, data)).toList(),
// //     );
// //   }

// //   Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
// //     final record = Record.fromSnapshot(data);
// //     return Padding(
// //       key: ValueKey(record.name),
// //       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
// //       child: Container(
// //         decoration: BoxDecoration(
// //           border: Border.all(color: Colors.grey),
// //           borderRadius: BorderRadius.circular(5.0),
// //         ),
// //         child: ListTile(
// //           title: Text(record.name),
// //           trailing: Text(record.votes.toString()),
// //           // onTap: () => record.reference.updateData({'votes': record.votes + 1}),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';
// // import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
// // // import 'package:flutter_osm_plugin_example/search_example.dart';

// // class MainExample extends StatefulWidget {
// //   MainExample({Key key}) : super(key: key);

// //   @override
// //   _MainExampleState createState() => _MainExampleState();
// // }

// // class _MainExampleState extends State<MainExample> {
// //   MapController controller;
// //   GlobalKey<ScaffoldState> scaffoldKey;
// //   ValueNotifier<bool> zoomNotifierActivation = ValueNotifier(false);
// //   ValueNotifier<bool> advPickerNotifierActivation = ValueNotifier(false);
// //   ValueNotifier<bool> trackingNotifier = ValueNotifier(false);

// //   @override
// //   void initState() {
// //     super.initState();import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:geoflutterfire/geoflutterfire.dart';

// class Settings extends StatelessWidget {
//   // Firestore firestore = Firestore.instance;
//   // Geoflutterfire geo = Geoflutterfire();

//   // Future<DocumentReference> _addGeoPoint() async {
//   //   var pos = await location.getLocation();
//   //   GeoFirePoint point =
//   //       geo.point(latitude: pos.latitude, longitude: pos.longitude);
//   //   return firestore
//   //       .collection('locations')
//   //       .add({'position': point.data, 'name': 'Yay I can be queried!'});
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(centerTitle: true, title: Text('Firestore')),
//       // body: _buildBody(context),
//     );
//   }

// //   Widget _buildBody(BuildContext context) {
// //     return StreamBuilder<QuerySnapshot>(
// //       stream: firestore.collection('ambulance_requests').snapshots(),
// //       builder: (context, snapshot) {
// //         if (!snapshot.hasData) return LinearProgressIndicator();

// //         return _buildList(context, snapshot.data.documents);
// //       },
// //     );
// //   }

// //   Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
// //     return ListView(
// //       padding: const EdgeInsets.only(top: 20.0),
// //       children: snapshot.map((data) => _buildListItem(context, data)).toList(),
// //     );
// //   }

// //   Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
// //     final record = Record.fromSnapshot(data);
// //     return Padding(
// //       key: ValueKey(record.name),
// //       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
// //       child: Container(
// //         decoration: BoxDecoration(
// //           border: Border.all(color: Colors.grey),
// //           borderRadius: BorderRadius.circular(5.0),
// //         ),
// //         child: ListTile(
// //           title: Text(record.name),
// //           trailing: Text(record.votes.toString()),
// //           // onTap: () => record.reference.updateData({'votes': record.votes + 1}),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';
// // import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
// // // import 'package:flutter_osm_plugin_example/search_example.dart';

// // class MainExample extends StatefulWidget {
// //   MainExample({Key key}) : super(key: key);

// //   @override
// //   _MainExampleState createState() => _MainExampleState();
// // }

// // class _MainExampleState extends State<MainExample> {
// //   MapController controller;
// //   GlobalKey<ScaffoldState> scaffoldKey;
// //   ValueNotifier<bool> zoomNotifierActivation = ValueNotifier(false);
// //   ValueNotifier<bool> advPickerNotifierActivation = ValueNotifier(false);
// //   ValueNotifier<bool> trackingNotifier = ValueNotifier(false);

// //   @override
// //   void initState() {
// //     super.initState();
// //     controller = MapController(
// //       initMapWithUserPosition: false,
// //       initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
// //     );
// //     scaffoldKey = GlobalKey<ScaffoldState>();
// //     // Future.delayed(Duration(seconds: 10), () async {
// //     //   await controller.drawRect(RectOSM(
// //     //     key: "rect",
// //     //     centerPoint: GeoPoint(latitude: 47.4333594, longitude: 8.4680184),
// //     //     distance: 1200.0,
// //     //     color: Colors.red,
// //     //     strokeWidth: 0.3,
// //     //   ));
// //     // });
// //     // Future.delayed(Duration(seconds: 20), () async {
// //     //   await controller.removeAllShapes();
// //     // });
// //   }

// //   @override
// //   void dispose() {
// //     controller.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       key: scaffoldKey,
// //       appBar: AppBar(
// //         title: const Text('OSM'),
// //         actions: <Widget>[
// //           IconButton(
// //             icon: Icon(Icons.info),
// //             onPressed: () async {
// //               await Navigator.popAndPushNamed(context, "/second");
// //             },
// //           ),
// //           IconButton(
// //             onPressed: () async {
// //               try {
// //                 await controller.removeLastRoad();

// //                 ///selection geoPoint
// //                 GeoPoint point = await controller.selectPosition();
// //                 GeoPoint point2 = await controller.selectPosition();
// //                 RoadInfo roadInformation =
// //                     await controller.drawRoad(point, point2);
// //                 print(
// //                     "duration:${Duration(seconds: roadInformation.duration.toInt()).inMinutes}");
// //                 print("distance:${roadInformation.distance}Km");
// //               } on RoadException catch (e) {
// //                 ScaffoldMessenger.of(context).showSnackBar(
// //                   SnackBar(
// //                     content: Text(
// //                       "${e.errorMessage()}",
// //                     ),
// //                   ),
// //                 );
// //               }
// //             },
// //             icon: Icon(Icons.map),
// //           ),
// //           IconButton(
// //             onPressed: () async {
// //               zoomNotifierActivation.value = !zoomNotifierActivation.value;
// //             },
// //             icon: Icon(Icons.zoom_out_map),
// //           ),
// //           IconButton(
// //             onPressed: () async {
// //               await Navigator.pushNamed(context, "/picker-result");
// //             },
// //             icon: Icon(Icons.search),
// //           ),
// //           IconButton(
// //             icon: Icon(Icons.select_all),
// //             onPressed: () async {
// //               if (advPickerNotifierActivation.value == false) {
// //                 advPickerNotifierActivation.value = true;
// //                 await controller.advancedPositionPicker();
// //               }
// //             },
// //           )
// //         ],
// //       ),
// //       body: OrientationBuilder(
// //         builder: (ctx, orientation) {
// //           return Container(
// //             child: Stack(
// //               children: [
// //                 OSMFlutter(
// //                   controller: controller,
// //                   //trackMyPosition: trackingNotifier.value,
// //                   useSecureURL: false,
// //                   showDefaultInfoWindow: false,
// //                   defaultZoom: 3.0,

// //                   onLocationChanged: (myLocation) {
// //                     print(myLocation);
// //                   },
// //                   onGeoPointClicked: (geoPoint) async {
// //                     ScaffoldMessenger.of(context).showSnackBar(
// //                       SnackBar(
// //                         content: Text(
// //                           "${geoPoint.toMap().toString()}",
// //                         ),
// //                         action: SnackBarAction(
// //                           onPressed: () => ScaffoldMessenger.of(context)
// //                               .hideCurrentSnackBar(),
// //                           label: "hide",
// //                         ),
// //                       ),
// //                     );
// //                   },
// //                   staticPoints: [
// //                     StaticPositionGeoPoint(
// //                       "line 1",
// //                       MarkerIcon(
// //                         icon: Icon(
// //                           Icons.train,
// //                           color: Colors.green,
// //                           size: 48,
// //                         ),
// //                       ),
// //                       [
// //                         GeoPoint(latitude: 47.4333594, longitude: 8.4680184),
// //                         GeoPoint(latitude: 47.4317782, longitude: 8.4716146),
// //                       ],
// //                     ),
// //                     StaticPositionGeoPoint(
// //                       "line 2",
// //                       MarkerIcon(
// //                         icon: Icon(
// //                           Icons.train,
// //                           color: Colors.red,
// //                           size: 48,
// //                         ),
// //                       ),
// //                       [
// //                         GeoPoint(latitude: 47.4433594, longitude: 8.4680184),
// //                         GeoPoint(latitude: 47.4517782, longitude: 8.4716146),
// //                       ],
// //                     )
// //                   ],
// //                   road: Road(
// //                     startIcon: MarkerIcon(
// //                       icon: Icon(
// //                         Icons.person,
// //                         size: 64,
// //                         color: Colors.brown,
// //                       ),
// //                     ),
// //                     roadColor: Colors.red,
// //                   ),
// //                   markerIcon: MarkerIcon(
// //                     icon: Icon(
// //                       Icons.home,
// //                       color: Colors.orange,
// //                       size: 64,
// //                     ),
// //                   ),
// //                 ),
// //                 Positioned(
// //                   bottom: 10,
// //                   left: 10,
// //                   child: ValueListenableBuilder<bool>(
// //                     valueListenable: zoomNotifierActivation,
// //                     builder: (ctx, visible, child) {
// //                       return AnimatedOpacity(
// //                         opacity: visible ? 1.0 : 0.0,
// //                         duration: Duration(milliseconds: 500),
// //                         child: child,
// //                       );
// //                     },
// //                     child: Column(
// //                       children: [
// //                         ElevatedButton(
// //                           child: Icon(Icons.add),
// //                           onPressed: () async {
// //                             controller.zoomIn();
// //                           },
// //                         ),
// //                         ElevatedButton(
// //                           child: Icon(Icons.remove),
// //                           onPressed: () async {
// //                             controller.zoomOut();
// //                           },
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //                 Positioned(
// //                   bottom: 10,
// //                   left: 10,
// //                   child: ValueListenableBuilder<bool>(
// //                     valueListenable: advPickerNotifierActivation,
// //                     builder: (ctx, visible, child) {
// //                       return AnimatedOpacity(
// //                         opacity: visible ? 1.0 : 0.0,
// //                         duration: Duration(milliseconds: 500),
// //                         child: child,
// //                       );
// //                     },
// //                     child: FloatingActionButton(
// //                       key: UniqueKey(),
// //                       child: Icon(Icons.arrow_forward),
// //                       heroTag: "confirmAdvPicker",
// //                       onPressed: () async {
// //                         advPickerNotifierActivation.value = false;
// //                         GeoPoint p =
// //                             await controller.selectAdvancedPositionPicker();
// //                         print(p);
// //                       },
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           );
// //         },
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () async {
// //           if (!trackingNotifier.value) {
// //             await controller.currentLocation();
// //             await controller.enableTracking();
// //           } else {
// //             await controller.disabledTracking();
// //           }
// //           trackingNotifier.value = !trackingNotifier.value;
// //         },
// //         child: ValueListenableBuilder<bool>(
// //           valueListenable: trackingNotifier,
// //           builder: (ctx, isTracking, _) {
// //             if (isTracking) {
// //               return Icon(Icons.gps_off_shaimport 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:geoflutterfire/geoflutterfire.dart';

// class Settings extends StatelessWidget {
//   // Firestore firestore = Firestore.instance;
//   // Geoflutterfire geo = Geoflutterfire();

//   // Future<DocumentReference> _addGeoPoint() async {
//   //   var pos = await location.getLocation();
//   //   GeoFirePoint point =
//   //       geo.point(latitude: pos.latitude, longitude: pos.longitude);
//   //   return firestore
//   //       .collection('locations')
//   //       .add({'position': point.data, 'name': 'Yay I can be queried!'});
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(centerTitle: true, title: Text('Firestore')),
//       // body: _buildBody(context),
//     );
//   }

// //   Widget _buildBody(BuildContext context) {
// //     return StreamBuilder<QuerySnapshot>(
// //       stream: firestore.collection('ambulance_requests').snapshots(),
// //       builder: (context, snapshot) {
// //         if (!snapshot.hasData) return LinearProgressIndicator();

// //         return _buildList(context, snapshot.data.documents);
// //       },
// //     );
// //   }

// //   Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
// //     return ListView(
// //       padding: const EdgeInsets.only(top: 20.0),
// //       children: snapshot.map((data) => _buildListItem(context, data)).toList(),
// //     );
// //   }

// //   Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
// //     final record = Record.fromSnapshot(data);
// //     return Padding(
// //       key: ValueKey(record.name),
// //       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
// //       child: Container(
// //         decoration: BoxDecoration(
// //           border: Border.all(color: Colors.grey),
// //           borderRadius: BorderRadius.circular(5.0),
// //         ),
// //         child: ListTile(
// //           title: Text(record.name),
// //           trailing: Text(record.votes.toString()),
// //           // onTap: () => record.reference.updateData({'votes': record.votes + 1}),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';
// // import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
// // // import 'package:flutter_osm_plugin_example/search_example.dart';

// // class MainExample extends StatefulWidget {
// //   MainExample({Key key}) : super(key: key);

// //   @override
// //   _MainExampleState createState() => _MainExampleState();
// // }

// // class _MainExampleState extends State<MainExample> {
// //   MapController controller;
// //   GlobalKey<ScaffoldState> scaffoldKey;
// //   ValueNotifier<bool> zoomNotifierActivation = ValueNotifier(false);
// //   ValueNotifier<bool> advPickerNotifierActivation = ValueNotifier(false);
// //   ValueNotifier<bool> trackingNotifier = ValueNotifier(false);

// //   @override
// //   void initState() {
// //     super.initState();
// //     controller = MapController(
// //       initMapWithUserPosition: false,
// //       initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
// //     );
// //     scaffoldKey = GlobalKey<ScaffoldState>();
// //     // Future.delayed(Duration(seconds: 10), () async {
// //     //   await controller.drawRect(RectOSM(
// //     //     key: "rect",
// //     //     centerPoint: GeoPoint(latitude: 47.4333594, longitude: 8.4680184),
// //     //     distance: 1200.0,
// //     //     color: Colors.red,
// //     //     strokeWidth: 0.3,
// //     //   ));
// //     // });
// //     // Future.delayed(Duration(seconds: 20), () async {
// //     //   await controller.removeAllShapes();
// //     // });
// //   }

// //   @override
// //   void dispose() {
// //     controller.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       key: scaffoldKey,
// //       appBar: AppBar(
// //         title: const Text('OSM'),
// //         actions: <Widget>[
// //           IconButton(
// //             icon: Icon(Icons.info),
// //             onPressed: () async {
// //               await Navigator.popAndPushNamed(context, "/second");
// //             },
// //           ),
// //           IconButton(
// //             onPressed: () async {
// //               try {
// //                 await controller.removeLastRoad();

// //                 ///selection geoPoint
// //                 GeoPoint point = await controller.selectPosition();
// //                 GeoPoint point2 = await controller.selectPosition();
// //                 RoadInfo roadInformation =
// //                     await controller.drawRoad(point, point2);
// //                 print(
// //                     "duration:${Duration(seconds: roadInformation.duration.toInt()).inMinutes}");
// //                 print("distance:${roadInformation.distance}Km");
// //               } on RoadException catch (e) {
// //                 ScaffoldMessenger.of(context).showSnackBar(
// //                   SnackBar(
// //                     content: Text(
// //                       "${e.errorMessage()}",
// //                     ),
// //                   ),
// //                 );
// //               }
// //             },
// //             icon: Icon(Icons.map),
// //           ),
// //           IconButton(
// //             onPressed: () async {
// //               zoomNotifierActivation.value = !zoomNotifierActivation.value;
// //             },
// //             icon: Icon(Icons.zoom_out_map),
// //           ),
// //           IconButton(
// //             onPressed: () async {
// //               await Navigator.pushNamed(context, "/picker-result");
// //             },
// //             icon: Icon(Icons.search),
// //           ),
// //           IconButton(
// //             icon: Icon(Icons.select_all),
// //             onPressed: () async {
// //               if (advPickerNotifierActivation.value == false) {
// //                 advPickerNotifierActivation.value = true;
// //                 await controller.advancedPositionPicker();
// //               }
// //             },
// //           )
// //         ],
// //       ),
// //       body: OrientationBuilder(
// //         builder: (ctx, orientation) {
// //           return Container(
// //             child: Stack(
// //               children: [
// //                 OSMFlutter(
// //                   controller: controller,
// //                   //trackMyPosition: trackingNotifier.value,
// //                   useSecureURL: false,
// //                   showDefaultInfoWindow: false,
// //                   defaultZoom: 3.0,

// //                   onLocationChanged: (myLocation) {
// //                     print(myLocation);
// //                   },
// //                   onGeoPointClicked: (geoPoint) async {
// //                     ScaffoldMessenger.of(context).showSnackBar(
// //                       SnackBar(
// //                         content: Text(
// //                           "${geoPoint.toMap().toString()}",
// //                         ),
// //                         action: SnackBarAction(
// //                           onPressed: () => ScaffoldMessenger.of(context)
// //                               .hideCurrentSnackBar(),
// //                           label: "hide",
// //                         ),
// //                       ),
// //                     );
// //                   },
// //                   staticPoints: [
// //                     StaticPositionGeoPoint(
// //                       "line 1",
// //                       MarkerIcon(
// //                         icon: Icon(
// //                           Icons.train,
// //                           color: Colors.green,
// //                           size: 48,
// //                         ),
// //                       ),
// //                       [
// //                         GeoPoint(latitude: 47.4333594, longitude: 8.4680184),
// //                         GeoPoint(latitude: 47.4317782, longitude: 8.4716146),
// //                       ],
// //                     ),
// //                     StaticPositionGeoPoint(
// //                       "line 2",
// //                       MarkerIcon(
// //                         icon: Icon(
// //                           Icons.train,
// //                           color: Colors.red,
// //                           size: 48,
// //                         ),
// //                       ),
// //                       [
// //                         GeoPoint(latitude: 47.4433594, longitude: 8.4680184),
// //                         GeoPoint(latitude: 47.4517782, longitude: 8.4716146),
// //                       ],
// //                     )
// //                   ],
// //                   road: Road(
// //                     startIcon: MarkerIcon(
// //                       icon: Icon(
// //                         Icons.person,
// //                         size: 64,
// //                         color: Colors.brown,
// //                       ),
// //                     ),
// //                     roadColor: Colors.red,
// //                   ),
// //                   markerIcon: MarkerIcon(
// //                     icon: Icon(
// //                       Icons.home,
// //                       color: Colors.orange,
// //                       size: 64,
// //                     ),
// //                   ),
// //                 ),
// //                 Positioned(
// //                   bottom: 10,
// //                   left: 10,
// //                   child: ValueListenableBuilder<bool>(
// //                     valueListenable: zoomNotifierActivation,
// //                     builder: (ctx, visible, child) {
// //                       return AnimatedOpacity(
// //                         opacity: visible ? 1.0 : 0.0,
// //                         duration: Duration(milliseconds: 500),
// //                         child: child,
// //                       );
// //                     },
// //                     child: Column(
// //                       children: [
// //                         ElevatedButton(
// //                           child: Icon(Icons.add),
// //                           onPressed: () async {
// //                             controller.zoomIn();
// //                           },
// //                         ),
// //                         ElevatedButton(
// //                           child: Icon(Icons.remove),
// //                           onPressed: () async {
// //                             controller.zoomOut();
// //                           },
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //                 Positioned(
// //                   bottom: 10,
// //                   left: 10,
// //                   child: ValueListenableBuilder<bool>(
// //                     valueListenable: advPickerNotifierActivation,
// //                     builder: (ctx, visible, child) {
// //                       return AnimatedOpacity(
// //                         opacity: visible ? 1.0 : 0.0,
// //                         duration: Duration(milliseconds: 500),
// //                         child: child,
// //                       );
// //                     },
// //                     child: FloatingActionButton(
// //                       key: UniqueKey(),
// //                       child: Icon(Icons.arrow_forward),
// //                       heroTag: "confirmAdvPicker",
// //                       onPressed: () async {
// //                         advPickerNotifierActivation.value = false;
// //                         GeoPoint p =
// //                             await controller.selectAdvancedPositionPicker();
// //                         print(p);
// //                       },
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           );
// //         },
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () async {
// //           if (!trackingNotifier.value) {
// //             await controller.currentLocation();
// //             await controller.enableTracking();
// //           } else {
// //             await controller.disabledTracking();
// //           }
// //           trackingNotifier.value = !trackingNotifier.value;
// //         },
// //         child: ValueListenableBuilder<bool>(
// //           valueListenable: trackingNotifier,
// //           builder: (ctx, isTracking, _) {
// //             if (isTracking) {
// //               return Icon(Icons.gps_off_sharp);
// //             }
// //             return Icon(Icons.my_location);
// //           },
// //         ),
// //       ),
// //     );
// //   }
// }
// rp);
// //             }
// //             return Icon(Icons.my_location);
// //           },
// //         ),
// //       ),
// //     );
// //   }
// }

// //     controller = MapController(
// //       initMapWithUserPosition: false,
// //       initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
// //     );
// //     scaffoldKey = GlobalKey<ScaffoldState>();
// //     // Future.delayed(Duration(seconds: 10), () async {
// //     //   await controller.drawRect(RectOSM(
// //     //     key: "rect",
// //     //     centerPoint: GeoPoint(latitude: 47.4333594, longitude: 8.4680184),
// //     //     distance: 1200.0,
// //     //     color: Colors.red,
// //     //     strokeWidth: 0.3,
// //     //   ));
// //     // });
// //     // Future.delayed(Duration(seconds: 20), () async {
// //     //   await controller.removeAllShapes();
// //     // });
// //   }

// //   @override
// //   void dispose() {
// //     controller.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       key: scaffoldKey,
// //       appBar: AppBar(
// //         title: const Text('OSM'),
// //         actions: <Widget>[
// //           IconButton(
// //             icon: Icon(Icons.info),
// //             onPressed: () async {
// //               await Navigator.popAndPushNamed(context, "/second");
// //             },
// //           ),
// //           IconButton(
// //             onPressed: () async {
// //               try {
// //                 await controller.removeLastRoad();

// //                 ///selection geoPoint
// //                 GeoPoint point = await controller.selectPosition();
// //                 GeoPoint point2 = await controller.selectPosition();
// //                 RoadInfo roadInformation =
// //                     await controller.drawRoad(point, point2);
// //                 print(
// //                     "duration:${Duration(seconds: roadInformation.duration.toInt()).inMinutes}");
// //                 print("distance:${roadInformation.distance}Km");
// //               } on RoadException catch (e) {
// //                 ScaffoldMessenger.of(context).showSnackBar(
// //                   SnackBar(
// //                     content: Text(
// //                       "${e.errorMessage()}",
// //                     ),
// //                   ),
// //                 );
// //               }
// //             },
// //             icon: Icon(Icons.map),
// //           ),
// //           IconButton(
// //             onPressed: () async {
// //               zoomNotifierActivation.value = !zoomNotifierActivation.value;
// //             },
// //             icon: Icon(Icons.zoom_out_map),
// //           ),
// //           IconButton(
// //             onPressed: () async {
// //               await Navigator.pushNamed(context, "/picker-result");
// //             },
// //             icon: Icon(Icons.search),
// //           ),
// //           IconButton(
// //             icon: Icon(Icons.select_all),
// //             onPressed: () async {
// //               if (advPickerNotifierActivation.value == false) {
// //                 advPickerNotifierActivation.value = true;
// //                 await controller.advancedPositionPicker();
// //               }
// //             },
// //           )
// //         ],
// //       ),
// //       body: OrientationBuilder(
// //         builder: (ctx, orientation) {
// //           return Container(
// //             child: Stack(
// //               children: [
// //                 OSMFlutter(
// //                   controller: controller,
// //                   //trackMyPosition: trackingNotifier.value,
// //                   useSecureURL: false,
// //                   showDefaultInfoWindow: false,
// //                   defaultZoom: 3.0,

// //                   onLocationChanged: (myLocation) {
// //                     print(myLocation);
// //                   },
// //                   onGeoPointClicked: (geoPoint) async {
// //                     ScaffoldMessenger.of(context).showSnackBar(
// //                       SnackBar(
// //                         content: Text(
// //                           "${geoPoint.toMap().toString()}",
// //                         ),
// //                         action: SnackBarAction(
// //                           onPressed: () => ScaffoldMessenger.of(context)
// //                               .hideCurrentSnackBar(),
// //                           label: "hide",
// //                         ),
// //                       ),
// //                     );
// //                   },
// //                   staticPoints: [
// //                     StaticPositionGeoPoint(
// //                       "line 1",
// //                       MarkerIcon(
// //                         icon: Icon(
// //                           Icons.train,
// //                           color: Colors.green,
// //                           size: 48,
// //                         ),
// //                       ),
// //                       [
// //                         GeoPoint(latitude: 47.4333594, longitude: 8.4680184),
// //                         GeoPoint(latitude: 47.4317782, longitude: 8.4716146),
// //                       ],
// //                     ),
// //                     StaticPositionGeoPoint(
// //                       "line 2",
// //                       MarkerIcon(
// //                         icon: Icon(
// //                           Icons.train,
// //                           color: Colors.red,
// //                           size: 48,
// //                         ),
// //                       ),
// //                       [
// //                         GeoPoint(latitude: 47.4433594, longitude: 8.4680184),
// //                         GeoPoint(latitude: 47.4517782, longitude: 8.4716146),
// //                       ],
// //                     )
// //                   ],
// //                   road: Road(
// //                     startIcon: MarkerIcon(
// //                       icon: Icon(
// //                         Icons.person,
// //                         size: 64,
// //                         color: Colors.brown,
// //                       ),
// //                     ),
// //                     roadColor: Colors.red,
// //                   ),
// //                   markerIcon: MarkerIcon(
// //                     icon: Icon(
// //                       Icons.home,
// //                       color: Colors.orange,
// //                       size: 64,
// //                     ),
// //                   ),
// //                 ),
// //                 Positioned(
// //                   bottom: 10,
// //                   left: 10,
// //                   child: ValueListenableBuilder<bool>(
// //                     valueListenable: zoomNotifierActivation,
// //                     builder: (ctx, visible, child) {
// //                       return AnimatedOpacity(
// //                         opacity: visible ? 1.0 : 0.0,
// //                         duration: Duration(milliseconds: 500),
// //                         child: child,
// //                       );
// //                     },
// //                     child: Column(
// //                       children: [
// //                         ElevatedButton(
// //                           child: Icon(Icons.add),
// //                           onPressed: () async {
// //                             controller.zoomIn();
// //                           },
// //                         ),
// //                         ElevatedButton(
// //                           child: Icon(Icons.remove),
// //                           onPressed: () async {
// //                             controller.zoomOut();
// //                           },
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //                 Positioned(
// //                   bottom: 10,
// //                   left: 10,
// //                   child: ValueListenableBuilder<bool>(
// //                     valueListenable: advPickerNotifierActivation,
// //                     builder: (ctx, visible, child) {
// //                       return AnimatedOpacity(
// //                         opacity: visible ? 1.0 : 0.0,
// //                         duration: Duration(milliseconds: 500),
// //                         child: child,
// //                       );
// //                     },
// //                     child: FloatingActionButton(
// //                       key: UniqueKey(),
// //                       child: Icon(Icons.arrow_forward),
// //                       heroTag: "confirmAdvPicker",
// //                       onPressed: () async {
// //                         advPickerNotifierActivation.value = false;
// //                         GeoPoint p =
// //                             await controller.selectAdvancedPositionPicker();
// //                         print(p);
// //                       },
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           );
// //         },
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () async {
// //           if (!trackingNotifier.value) {
// //             await controller.currentLocation();
// //             await controller.enableTracking();
// //           } else {
// //             await controller.disabledTracking();
// //           }
// //           trackingNotifier.value = !trackingNotifier.value;
// //         },
// //         child: ValueListenableBuilder<bool>(
// //           valueListenable: trackingNotifier,
// //           builder: (ctx, isTracking, _) {
// //             if (isTracking) {
// //               return Icon(Icons.gps_off_sharp);
// //             }
// //             return Icon(Icons.my_location);
// //           },
// //         ),
// //       ),
// //     );
// //   }
// }
