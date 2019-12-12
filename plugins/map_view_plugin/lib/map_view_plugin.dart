import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MapViewPlugin extends StatelessWidget {
  const MapViewPlugin({Key key, @required this.mapHash}) : super(key: key);
  final String mapHash;

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> creationParams = <String, dynamic>{
      'hash': mapHash,
    };
    if (Platform.isAndroid) {
      return Container();
    } else {
      return UiKitView(
        viewType: 'plugins.fnow.com/map_view',
        creationParams: creationParams,
        creationParamsCodec: const StandardMessageCodec(),
      );
    }
  }
}
