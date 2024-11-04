import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  final bool authenticated;
  const SplashPage({super.key, required this.authenticated});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
   Future.delayed(Duration(seconds: 2),(){
     print(widget.authenticated);
     if(widget.authenticated){
       context.go('/home');
     }else{
       context.go('/login');
     }
   });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Splash'),
      ),
    );
  }
}
