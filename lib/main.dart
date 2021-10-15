import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maps Demo',
      debugShowCheckedModeBanner: false,
      home: MapWidget(),
    );
  }
}

class MapWidget extends StatefulWidget {
  const MapWidget({Key? key}) : super(key: key);



  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(33.68781925804353, 73.047608210824),
    zoom: 11.5,
  );

  late GoogleMapController _googleMapController;


  late Marker _origin =  Marker(
    markerId: const MarkerId('origin'),
    infoWindow: const InfoWindow(title: 'Origin'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    position: LatLng(33.659202994622184, 73.02385996612809),
  ) ;


  late Marker _destination = Marker(
    markerId: const MarkerId('destination'),
    infoWindow: const InfoWindow(title: 'Destination'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    position: LatLng(33.6750614538563, 73.03501795563196),
  ) ;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _googleMapController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('My Google Map', style: TextStyle(color: Colors.blue),),

      ),
      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        myLocationButtonEnabled: true,
        zoomControlsEnabled: false,

        onMapCreated: (controller) => _googleMapController = controller,
        markers: {
           _origin,
           _destination,
        },
      ),
      floatingActionButton: FloatingActionButton(

        backgroundColor: Colors.white,
        onPressed: () => _googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(_initialCameraPosition),),

        child: const Icon(Icons.center_focus_strong, color: Colors.blue,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
