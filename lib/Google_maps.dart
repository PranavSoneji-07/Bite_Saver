import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:bite_saver/Provider/Maps_Provider.dart';

class GoogleMapWidget extends StatefulWidget {
  @override
  _GoogleMapWidgetState createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  GoogleMapController? mapController;
  LatLng _defaultPosition = LatLng(19.0760, 72.8777); // Mumbai, India
  LatLng? _initialPosition;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  void _getUserLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
    });

    // Fetch restaurants near user location
    Provider.of<MapsProvider>(context, listen: false)
        .fetchNearbyRestaurants(_initialPosition!);
  }

  @override
  Widget build(BuildContext context) {
    final mapsProvider = Provider.of<MapsProvider>(context);

    return _initialPosition == null
        ? Center(child: CircularProgressIndicator())
        : GoogleMap(
      onMapCreated: (controller) => mapController = controller,
      initialCameraPosition: CameraPosition(
        target: _initialPosition!,
        zoom: 14,
      ),
      markers: mapsProvider.markers, // **Display restaurant markers**
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
    );
  }
}
