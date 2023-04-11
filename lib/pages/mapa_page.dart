import 'package:flutter/material.dart';
import 'package:qr_reader/models/scan_models.dart';

class MapaPage extends StatelessWidget {
   
  const MapaPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    final ScanModel scan = ModalRoute.of(context)!.settings.arguments as ScanModel;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coordenadas'),
      ),
      body: Center(
         child: Text(scan.valor),
      ),
    );
  }
}