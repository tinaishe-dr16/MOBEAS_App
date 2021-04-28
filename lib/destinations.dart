import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:MOBEAS/secrets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'geolocator_service.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math' show cos, sqrt, asin;

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
  GoogleMapController mapController;
  final GeolocatorService geoService = GeolocatorService();
  Completer<GoogleMapController> _controller = Completer();

  Position _currentPosition;
  String _currentAddress;

  final startAddressController = TextEditingController();
  final destinationAddressController = TextEditingController();

  final startAddressFocusNode = FocusNode();
  final desrinationAddressFocusNode = FocusNode();

  String _startAddress = '';
  String _destinationAddress = '';
  String _placeDistance;

  Set<Marker> markers = {};

  PolylinePoints polylinePoints;
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _textField({
    TextEditingController controller,
    FocusNode focusNode,
    String label,
    String hint,
    double width,
    Icon prefixIcon,
    Widget suffixIcon,
    Function(String) locationCallback,
  }) {
    return Container(
      width: width * 0.8,
      child: TextField(
        onChanged: (value) {
          locationCallback(value);
        },
        controller: controller,
        focusNode: focusNode,
        decoration: new InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: Colors.grey[400],
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: Colors.blue[300],
              width: 2,
            ),
          ),
          contentPadding: EdgeInsets.all(15),
          hintText: hint,
        ),
      ),
    );
  }

  // Method for retrieving the current location
  _getCurrentLocation() async {
    await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        _currentPosition = position;
        print('CURRENT POS: $_currentPosition');
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 18.0,
            ),
          ),
        );
      });
      await _getAddress();
    }).catchError((e) {
      print(e);
    });
  }

  // Method for retrieving the address
  _getAddress() async {
    try {
      List<geo.Placemark> p = await geo.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      geo.Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";
        startAddressController.text = _currentAddress;
        _startAddress = _currentAddress;
      });
    } catch (e) {
      print(e);
    }
  }

  // Method for calculating the distance between two places
  Future<bool> _calculateDistance() async {
    try {
      // Retrieving placemarks from addresses
      List<geo.Location> startPlacemark =
          await geo.locationFromAddress(_startAddress);
      List<geo.Location> destinationPlacemark =
          await geo.locationFromAddress(_destinationAddress);

      if (startPlacemark != null && destinationPlacemark != null) {
        // Use the retrieved coordinates of the current position,
        // instead of the address if the start position is user's
        // current position, as it results in better accuracy.
        Position startCoordinates = _startAddress == _currentAddress
            ? Position(
                latitude: _currentPosition.latitude,
                longitude: _currentPosition.longitude)
            : Position(
                latitude: startPlacemark[0].latitude,
                longitude: startPlacemark[0].longitude);
        Position destinationCoordinates = Position(
            latitude: destinationPlacemark[0].latitude,
            longitude: destinationPlacemark[0].longitude);

        // Start Location Marker
        Marker startMarker = Marker(
          markerId: MarkerId('$startCoordinates'),
          position: LatLng(
            startCoordinates.latitude,
            startCoordinates.longitude,
          ),
          infoWindow: InfoWindow(
            title: 'Start',
            snippet: _startAddress,
          ),
          icon: BitmapDescriptor.defaultMarker,
        );

        // Destination Location Marker
        Marker destinationMarker = Marker(
          markerId: MarkerId('$destinationCoordinates'),
          position: LatLng(
            destinationCoordinates.latitude,
            destinationCoordinates.longitude,
          ),
          infoWindow: InfoWindow(
            title: 'Destination',
            snippet: _destinationAddress,
          ),
          icon: BitmapDescriptor.defaultMarker,
        );

        // Adding the markers to the list
        markers.add(startMarker);
        markers.add(destinationMarker);

        print('START COORDINATES: $startCoordinates');
        print('DESTINATION COORDINATES: $destinationCoordinates');

        Position _northeastCoordinates;
        Position _southwestCoordinates;

        // Calculating to check that the position relative
        // to the frame, and pan & zoom the camera accordingly.
        double miny =
            (startCoordinates.latitude <= destinationCoordinates.latitude)
                ? startCoordinates.latitude
                : destinationCoordinates.latitude;
        double minx =
            (startCoordinates.longitude <= destinationCoordinates.longitude)
                ? startCoordinates.longitude
                : destinationCoordinates.longitude;
        double maxy =
            (startCoordinates.latitude <= destinationCoordinates.latitude)
                ? destinationCoordinates.latitude
                : startCoordinates.latitude;
        double maxx =
            (startCoordinates.longitude <= destinationCoordinates.longitude)
                ? destinationCoordinates.longitude
                : startCoordinates.longitude;

        _southwestCoordinates = Position(latitude: miny, longitude: minx);
        _northeastCoordinates = Position(latitude: maxy, longitude: maxx);

        // Accommodate the two locations within the
        // camera view of the map
        mapController.animateCamera(
          CameraUpdate.newLatLngBounds(
            LatLngBounds(
              northeast: LatLng(
                _northeastCoordinates.latitude,
                _northeastCoordinates.longitude,
              ),
              southwest: LatLng(
                _southwestCoordinates.latitude,
                _southwestCoordinates.longitude,
              ),
            ),
            100.0,
          ),
        );

        // Calculating the distance between the start and the end positions
        // with a straight path, without considering any route
        // double distanceInMeters = await Geolocator().bearingBetween(
        //   startCoordinates.latitude,
        //   startCoordinates.longitude,
        //   destinationCoordinates.latitude,
        //   destinationCoordinates.longitude,
        // );

        await _createPolylines(startCoordinates, destinationCoordinates);

        double totalDistance = 0.0;

        // Calculating the total distance by adding the distance
        // between small segments
        for (int i = 0; i < polylineCoordinates.length - 1; i++) {
          totalDistance += _coordinateDistance(
            polylineCoordinates[i].latitude,
            polylineCoordinates[i].longitude,
            polylineCoordinates[i + 1].latitude,
            polylineCoordinates[i + 1].longitude,
          );
        }

        setState(() {
          _placeDistance = totalDistance.toStringAsFixed(2);
          print('DISTANCE: $_placeDistance km');
        });

        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  // Formula for calculating distance between two coordinates
  // https://stackoverflow.com/a/54138876/11910277
  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  // Create the polylines for showing the route between two places
  _createPolylines(Position start, Position destination) async {
    polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      Secrets.API_KEY, // Google Maps API Key
      PointLatLng(start.latitude, start.longitude),
      PointLatLng(destination.latitude, destination.longitude),
      travelMode: TravelMode.transit,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    PolylineId id = PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.red,
      points: polylineCoordinates,
      width: 3,
    );
    polylines[id] = polyline;
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    geoService.getCurrentLocation().listen((position) {
      centerScreen(position);
    });
  }

  Future<void> centerScreen(Position position) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(position.latitude, position.longitude), zoom: 18.0)));
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var requests = 0;

    return Container(
      height: height,
      width: width,
      child: Scaffold(
        key: _scaffoldKey,
        body: Stack(
          children: <Widget>[
            // Map View
            GoogleMap(
              markers: markers != null ? Set<Marker>.from(markers) : null,
              initialCameraPosition: _initialLocation,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              mapType: MapType.normal,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              polylines: Set<Polyline>.of(polylines.values),
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
                _controller.complete(controller);
              },
            ),
            // Show zoom buttons
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClipOval(
                      child: Material(
                        color: Colors.blue[100], // button color
                        child: InkWell(
                          splashColor: Colors.blue, // inkwell color
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Icon(Icons.add),
                          ),
                          onTap: () {
                            mapController.animateCamera(
                              CameraUpdate.zoomIn(),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ClipOval(
                      child: Material(
                        color: Colors.blue[100], // button color
                        child: InkWell(
                          splashColor: Colors.blue, // inkwell color
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Icon(Icons.remove),
                          ),
                          onTap: () {
                            mapController.animateCamera(
                              CameraUpdate.zoomOut(),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // Show the place input fields & button for
            // showing the route
            SafeArea(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    width: width * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Places',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          SizedBox(height: 10),
                          _textField(
                              label: 'Start',
                              hint: 'Choose starting point',
                              prefixIcon: Icon(Icons.looks_one),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.my_location),
                                onPressed: () {
                                  startAddressController.text = _currentAddress;
                                  _startAddress = _currentAddress;
                                },
                              ),
                              controller: startAddressController,
                              focusNode: startAddressFocusNode,
                              width: width,
                              locationCallback: (String value) {
                                setState(() {
                                  _startAddress = value;
                                });
                              }),
                          SizedBox(height: 10),
                          _textField(
                              label: '961 Boarding House',
                              hint: 'Choose destination',
                              prefixIcon: Icon(Icons.looks_two),
                              controller: destinationAddressController,
                              focusNode: desrinationAddressFocusNode,
                              width: width,
                              locationCallback: (String value) {
                                setState(() {
                                  _destinationAddress = value;
                                });
                              }),
                          SizedBox(height: 10),
                          Visibility(
                            visible: _placeDistance == null ? false : true,
                            child: Text(
                              'DISTANCE: $_placeDistance km',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          RaisedButton(
                            // child: Text('Show Route'),
                            onPressed: () {
                              _launchURL(String url) async {
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              }

                              const url =
                                  'https://www.google.com/maps/dir/?api=1&origin=-19.5171721,29.8389681&destination=-19.497975,29.848276&travelmode=driving&dir_action=navigate';
                              _launchURL(url);
                            },
                            // onPressed: (_startAddress != '' &&
                            //         _destinationAddress != '')
                            //     ? () async {
                            //         startAddressFocusNode.unfocus();
                            //         desrinationAddressFocusNode.unfocus();
                            //         setState(() {
                            //           if (markers.isNotEmpty) markers.clear();
                            //           if (polylines.isNotEmpty)
                            //             polylines.clear();
                            //           if (polylineCoordinates.isNotEmpty)
                            //             polylineCoordinates.clear();
                            //           _placeDistance = null;
                            //         });

                            //         _calculateDistance().then((isCalculated) {
                            //           if (isCalculated) {
                            //             ScaffoldMessenger.of(context)
                            //                 .showSnackBar(
                            //               SnackBar(
                            //                 content: Text(
                            //                     'Distance Calculated Sucessfully'),
                            //               ),
                            //             );
                            //           } else {
                            //             ScaffoldMessenger.of(context)
                            //                 .showSnackBar(
                            //               SnackBar(
                            //                 content: Text(
                            //                     'Error Calculating Distance'),
                            //               ),
                            //             );
                            //           }
                            //         });
                            //       }
                            //     : null,
                            color: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Show Route'.toUpperCase(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Show current location button
            SafeArea(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
                  child: ClipOval(
                    child: Material(
                      color: Colors.orange[100], // button color
                      child: InkWell(
                        splashColor: Colors.orange, // inkwell color
                        child: SizedBox(
                          width: 56,
                          height: 56,
                          child: Icon(Icons.my_location),
                        ),
                        onTap: () {
                          mapController.animateCamera(
                            CameraUpdate.newCameraPosition(
                              CameraPosition(
                                target: LatLng(
                                  _currentPosition.latitude,
                                  _currentPosition.longitude,
                                ),
                                zoom: 18.0,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int buildRequests2(int requests) => requests;
}

// class Destinations extends StatefulWidget {
//   Destinations({Key key}) : super(key: key);

//   @override
//   _DestinationsState createState() => _DestinationsState();
// }

// class _DestinationsState extends State<Destinations> {
//   _getCurrentLocation() async {
//   await _geolocator
//       .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
//       .then((Position position) async {
//     setState(() {
//       // Store the position in the variable
//       _currentPosition = position;

//       print('CURRENT POS: $_currentPosition');

//       // For moving the camera to current location
//       mapController.animateCamera(
//         CameraUpdate.newCameraPosition(
//           CameraPosition(
//             target: LatLng(position.latitude, position.longitude),
//             zoom: 18.0,
//           ),
//         ),
//       );
//     });
//   }).catchError((e) {
//     print(e);
//   });
// }

//   final startAddressController = TextEditingController();

// _getAddress() async {
//   try {
//     // Places are retrieved using the coordinates
//     List<Placemark> p = await _geolocator.placemarkFromCoordinates(
//         _currentPosition.latitude, _currentPosition.longitude);

//     // Taking the most probable result
//     Placemark place = p[0];

//     setState(() {

//       // Structuring the address
//       _currentAddress =
//           "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";

//       // Update the text of the TextField
//       startAddressController.text = _currentAddress;

//       // Setting the user's present location as the starting address
//       _startAddress = _currentAddress;
//     });
//   } catch (e) {
//     print(e);
//   }
// }
// List<Placemark> startPlacemark =
//     await _geolocator.placemarkFromAddress(_startAddress);
// List<Placemark> destinationPlacemark =
//     await _geolocator.placemarkFromAddress(_destinationAddress);

// // Retrieving coordinates
// Position startCoordinates = startPlacemark[0].position;
// Position destinationCoordinates = destinationPlacemark[0].position;

// //placing markers
// Set<Marker> markers = {};

// // Start Location Marker
// Marker startMarker = Marker(
//   markerId: MarkerId('$startCoordinates'),
//   position: LatLng(
//     startCoordinates.latitude,
//     startCoordinates.longitude,
//   ),
//   infoWindow: InfoWindow(
//     title: 'Start',
//     snippet: _startAddress,
//   ),
//   icon: BitmapDescriptor.defaultMarker,
// );

// // Destination Location Marker
// Marker destinationMarker = Marker(
//   markerId: MarkerId('$destinationCoordinates'),
//   position: LatLng(
//     destinationCoordinates.latitude,
//     destinationCoordinates.longitude,
//   ),
//   infoWindow: InfoWindow(
//     title: 'Destination',
//     snippet: _destinationAddress,
//   ),
//   icon: BitmapDescriptor.defaultMarker,
// );
// // Add the markers to the list
// markers.add(startMarker);
// markers.add(destinationMarker);

// // Define two position variables
// Position _northeastCoordinates;
// Position _southwestCoordinates;

// // Calculating to check that
// // southwest coordinate <= northeast coordinate
// if (startCoordinates.latitude <= destinationCoordinates.latitude) {
//   _southwestCoordinates = startCoordinates;
//   _northeastCoordinates = destinationCoordinates;
// } else {
//   _southwestCoordinates = destinationCoordinates;
//   _northeastCoordinates = startCoordinates;
// }

// // Accommodate the two locations within the
// // camera view of the map
// mapController.animateCamera(
//   CameraUpdate.newLatLngBounds(
//     LatLngBounds(
//       northeast: LatLng(
//         _northeastCoordinates.latitude,
//         _northeastCoordinates.longitude,
//       ),
//       southwest: LatLng(
//         _southwestCoordinates.latitude,
//         _southwestCoordinates.longitude,
//       ),
//     ), // padding
//   ),
// );

// final LatLng _center = const LatLng(-19.5177903, 29.8378325);
// void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//     locatePosition();
//   }
// GoogleMapController mapController;

//   Position currentPosition;
//   var geoLocater = Geolocator();

//   void locatePosition() async {
//     Position position = await Geolocator()
//         .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//     currentPosition = position;
//     LatLng latLangPosition = LatLng(position.latitude, position.longitude);
//     CameraPosition cameraPosition =
//         new CameraPosition(target: latLangPosition, zoom: 18);
//     mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GoogleMap(
//        mapType: MapType.normal,
//           zoomGesturesEnabled: true,
//           myLocationButtonEnabled: true,
//           myLocationEnabled: true,
//           mapToolbarEnabled: true,
//           onMapCreated: _onMapCreated,
//           initialCameraPosition: CameraPosition(
//             target: _center,
//             zoom: 16.0,
//           ),
//         markers: markers != null ? Set<Marker>.from(markers) : null,
//     );
//   }
// }
