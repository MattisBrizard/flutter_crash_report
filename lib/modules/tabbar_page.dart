import 'package:flutter/material.dart';
import 'package:poc_fnow/modules/map_view.dart';

class TabBarPage extends StatefulWidget {
  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(
      vsync: this,
      length: _widgetOptions.length,
    );
  }

  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    Center(
      child: Text(
        'Index 0: Flutter',
      ),
    ),
    MapView()
  ];

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
        title: const Text('Tabbar Map'),
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
            title: Text('Flutter home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Native Map'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
