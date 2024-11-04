import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer:Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text(
                'Navigation',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),

            ListTile(
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                context.go('/home/profile');
              },
            ),

            ListTile(
              title: const Text('Chat'),
              onTap: () {
                Navigator.pop(context);
                context.go('/home/chat');

              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                context.go('/login'); // Assuming you want to log out and go to login screen
              },
            ),
          ],
        ),
      ) ,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [

          ElevatedButton(
              onPressed: () {
                context.go('/home/profile');
              },
              child: Text('Profile')),
          ElevatedButton(
              onPressed: () {
                context.go('/login');
              },
              child: Text('logout')),
        ],
      ),
    );
  }
}
