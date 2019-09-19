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
    var markers = <Marker>[
      Marker(
        width: 40.0,
        height: 40.0,
        point: LatLng(24.5, 121.0),
        builder: (ctx) => Container(
          child: FlutterLogo(),
        ),
      ),
      Marker(
        // width: 500.0,
        // height: 500.0,
        point: LatLng(23.5, 120.5),
        builder: (ctx) => Container(
          child: Icon(
            Icons.location_on,
            color: Colors.pink,
            size: 40.0,
          ),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Map')),
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
            MarkerLayerOptions(markers: markers),
          ],
        ),
      ),
    );
  }
}
