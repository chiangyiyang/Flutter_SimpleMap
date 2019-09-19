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
        width: 100.0,
        height: 100.0,
        point: LatLng(23.5, 120.5),
        builder: (ctx) => Container(
          child: Icon(
            Icons.location_on,
            color: Colors.pink,
            size: 60.0,
          ),
        ),
        // anchorPos: AnchorPos.align(AnchorAlign.left)
        // anchorPos: AnchorPos.align(AnchorAlign.right)
        // anchorPos: AnchorPos.align(AnchorAlign.top)
        // anchorPos: AnchorPos.align(AnchorAlign.bottom)
        anchorPos: AnchorPos.align(AnchorAlign.center)
      ),
    ];

    var circleMarkers = <CircleMarker>[
      CircleMarker(
          point: LatLng(23.5, 120.5),
          color: Colors.blue.withOpacity(0.7),
          borderStrokeWidth: 2,
          useRadiusInMeter: true,
          radius: 20000 // 2000 meters | 2 km
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
            CircleLayerOptions(circles: circleMarkers),
            MarkerLayerOptions(markers: markers),
          ],
        ),
      ),
    );
  }
}
