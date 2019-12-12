import 'package:flutter/material.dart';
import 'package:map_view_plugin/map_view_plugin.dart';

class MapView extends StatefulWidget {
  const MapView();

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapViewPlugin(
        mapHash: 'YOUR_MAP_HASH',
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.map),
        onPressed: () {},
      ),
    );
  }
}
