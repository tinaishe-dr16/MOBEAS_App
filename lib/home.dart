import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'nav.dart';
import 'firstaid.dart';
import 'profile.dart';
import 'settings.dart';
import 'package:geolocator/geolocator.dart';

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
      FirstAid(),
      Profile(),
      Settings(),
    ];

    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('MOBEAS Alerter'),
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
            title: Text('First Aid'),
            backgroundColor: Colors.red,
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
            backgroundColor: Colors.red,
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
            backgroundColor: Colors.red,
          )
        ],
      ),
    );
  }
}

class MapTab extends StatelessWidget {
  GoogleMapController mapController;

  Position currentPosition;
  var geoLocater = Geolocator();

  void locatePosition() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;
    LatLng latLangPosition = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition =
        new CameraPosition(target: latLangPosition, zoom: 14);
    mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  final LatLng _center = const LatLng(-19.5177903, 29.8378325);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    locatePosition();
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
                onPressed: () {},
                child: Text("Ambulance Request"),
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
}
