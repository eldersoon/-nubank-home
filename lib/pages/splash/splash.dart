import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home/home_page.dart';

class SplashApp extends StatefulWidget {
  @override
  _SplashAppState createState() => _SplashAppState();
}

class _SplashAppState extends State<SplashApp> {
  @override
  void initState() {
    super.initState();
    delay();
  }

  Future<void> delay() async {
    return await Future.delayed(
        Duration(
          milliseconds: 2000,
        ), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return Home();
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: Center(
        child: Image.asset(
          'assets/images/nubank.png',
          height: 50,
          color: Colors.white,
        ),
      ),
    );
  }
}
