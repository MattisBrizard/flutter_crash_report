import 'package:flutter/material.dart';
import 'package:poc_fnow/modules/map_view.dart';

/// A widget.
class HomePage extends StatelessWidget {
  /// Creates a [HomePage].
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('Map Page'),
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MapView(),
            ),
          ),
        ),
      ),
    );
  }
}
