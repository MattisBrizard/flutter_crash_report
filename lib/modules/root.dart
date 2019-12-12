import 'package:flutter/material.dart';
import 'package:poc_fnow/modules/home_page.dart';
import 'package:poc_fnow/modules/map_view.dart';

/// A widget.
class Root extends StatefulWidget {
  /// Creates a [Root].
  const Root({
    Key key,
  }) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> with SingleTickerProviderStateMixin<Root> {
  TabController _tabController;
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = const <Widget>[
    HomePage(),
    MapView(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(
      vsync: this,
      length: _widgetOptions.length,
    );
  }

  void _onItemTapped(int index) {
    _tabController.index = index;
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crash'),
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Map'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
