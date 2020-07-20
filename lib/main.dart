import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/pages/splash/splash.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext contexr) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nubank Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: SplashApp(),
    );
  }
}

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.purple[800]));

  runApp(MyApp());
}
