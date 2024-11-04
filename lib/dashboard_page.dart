import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/main.dart';

class DashBoardPage extends StatefulWidget {
  final Widget child;
  const DashBoardPage({super.key, required this.child});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  int _selectedIndex = 0;


  static const List<String> _routes = [
    '/home',
    '/search',
    '/profile',
    '/settings',
  ];
  // Handler for tapping a navigation item
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      context.go(_routes[index]);
    });
  }
  void refresh() {
    setState(() {
      // Perform refresh logic here
      print("Dashboard refreshed!");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,


      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      body: widget.child,
    );
  }
}
