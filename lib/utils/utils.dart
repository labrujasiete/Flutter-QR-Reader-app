import 'package:flutter/material.dart';
import 'package:qr_reader/models/scan_models.dart';
import 'package:url_launcher/url_launcher.dart';




theLaunchUrl( BuildContext context, ScanModel scan) async {

  final url = scan.valor;

  if( scan.tipo == 'http') {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  } else { 
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }

}




