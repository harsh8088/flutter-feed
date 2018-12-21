import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MapPage();
  }

//  https://api.chucknorris.io/jokes/random

}

class _MapPage extends State<MapPage> {
  GoogleMapController mapController;
  Location _location = new Location();
  bool isLoaded;
  String error;
  Map<String, double> location;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Google Maps')),
      body: GoogleMap(
        onMapCreated: isLoaded ? _onMapUpdated : _onMapCreated,
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  void loadCurrentLocation() async {
    try {
      location = await _location.getLocation();
    } on Exception catch (e) {
      error = e.toString();
    }

    error = null;

    if (location != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  _onMapUpdated(GoogleMapController controller) {
    final lat = location['latitude'];
    final lon = location['longitude'];
    controller.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
      bearing: 270.0,
      target: LatLng(lat, lon),
      tilt: 30.0,
      zoom: 17.0,
    )));
  }
}
