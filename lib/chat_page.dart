import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final int id;
  const ChatPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    print(id);
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Page'),
      ),
    );
  }
}
