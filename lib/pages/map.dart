import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class MapPage extends StatelessWidget {
  final double longitude;
  final double latitude;
  final double zoom;

  MapPage(this.longitude, this.latitude, this.zoom);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: FlutterMap(
          options: MapOptions(
            center: LatLng(latitude, longitude),
            zoom: zoom,
          ),
          layers: [
            TileLayerOptions(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c']),
          ],
        ),
      ),
    );
  }
}
