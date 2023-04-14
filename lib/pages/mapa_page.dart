import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_reader/models/scan_models.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapaPage extends StatefulWidget {
   
  const MapaPage({Key? key}) : super(key: key);

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {

    final Completer<GoogleMapController> _controller =
    Completer<GoogleMapController>();

    MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {

    final ScanModel scan = ModalRoute.of(context)!.settings.arguments as ScanModel;
    
    final CameraPosition puntoInicial = CameraPosition(
      target: scan.getLatLng(),
      zoom: 17,
      tilt: 45
    );

    //Marcadores
    Set<Marker> markers = new Set<Marker>();

    markers.add(new Marker(
      markerId: MarkerId('geo-location'),
      position: scan.getLatLng()
      )
    );
    
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coordenadas'),
        actions: [
          IconButton(
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: scan.getLatLng(),
                    zoom: 17,
                    tilt: 45
                    )
                )
                );
            }, 
            icon: const Icon(Icons.my_location),
            )
        ],
      ),
      body: GoogleMap(
        zoomControlsEnabled: false,
        markers: markers,
        myLocationButtonEnabled: false,
        mapType: mapType,
        initialCameraPosition: puntoInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.layers),
        onPressed: (){
          if( mapType == MapType.normal ){
            mapType = MapType.satellite;
          } else { 
            mapType = MapType.normal;
          }

          setState(() {});
        }
        ),
    );
  }
}