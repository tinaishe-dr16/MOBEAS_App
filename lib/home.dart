import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'geolocator_service.dart';
import 'nav.dart';
import 'requests.dart';
import 'profile.dart';
import 'settings.dart' as settings;
import 'package:geolocator/geolocator.dart';
import 'package:fluttertoast/fluttertoast.dart';

final requestsRef = FirebaseFirestore.instance.collection('requests');

class Home extends StatefulWidget {
  final int pageNumber;
  Home({Key key, this.pageNumber = 0}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedTab;

  @override
  void initState() {
    _selectedTab = widget.pageNumber;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var tabs = [
      MapTab(),
      Requests(),
      Profile(),
      //settings.Settings(),
    ];

    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('MOBEAS Driver'),
        backgroundColor: Colors.red[700],
      ),
      body: tabs[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            _selectedTab = index;
          });
        },
        currentIndex: _selectedTab,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            backgroundColor: Colors.red,
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.accessibility),
            title: Text('Requests'),
            backgroundColor: Colors.red,
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
            backgroundColor: Colors.red,
          ),
          // const BottomNavigationBarItem(
          //   icon: Icon(Icons.settings),
          //  title: Text('Settings'),
          //   backgroundColor: Colors.red,
          // )
        ],
      ),
    );
  }
}

class MapTab extends StatefulWidget {
  @override
  _MapTabState createState() => _MapTabState();
}

class _MapTabState extends State<MapTab> {
  final GeolocatorService geoService = GeolocatorService();
  Completer<GoogleMapController> _controller = Completer();
  Position currentPosition;
  GoogleMapController mapController;
  var geoLocater = Geolocator();
  final LatLng _center = const LatLng(-19.5177903, 29.8378325);
  LatLng latLangPosition;

  displayToastMessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }

  void sendToFirebase() {
    int randomInt = Random().nextInt(1000);
    print(latLangPosition);
    // play with latlongposition to get desired data
    requestsRef.doc('$randomInt').set({'position': latLangPosition});
  }

  //TODO: to get postions from firebase
  void getPositions() async {
    List<LatLng> reqestsPositions;
    QuerySnapshot firebaseData = await requestsRef.get();

    firebaseData.docs.map((doc) {
      print(doc.data());
      reqestsPositions.add(doc.data()['position']);
    });
    print(reqestsPositions);
  }

  @override
  void initState() {
    geoService.getCurrentLocation().listen((position) {
      centerScreen(position);
    });
    super.initState();
  }

  void locatePosition() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;
    latLangPosition = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition =
        new CameraPosition(target: latLangPosition, zoom: 18.0);
    mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    locatePosition();
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          mapType: MapType.normal,
          zoomGesturesEnabled: true,
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          mapToolbarEnabled: true,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 16.0,
          ),
        ),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.red,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Home(pageNumber: 1)));
                  // sendToFirebase();
                  // displayToastMessage("Request successfully sent", context);
                },
                child: Text("Check Ambulance Requests"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> centerScreen(Position position) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(position.latitude, position.longitude), zoom: 18.0)));
  }
}

// RaisedButton(
//     child: Text('Create Record'),
//     onPressed: () {
//       createRecord();
//     },
// ),
