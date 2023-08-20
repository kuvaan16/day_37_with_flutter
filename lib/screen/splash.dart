import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homepage.dart';
import 'introduction.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showSplash = true;

  @override
  void initState() {
    super.initState();
    _checkFirstTime();
  }

  Future<void> _checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool showSplash = prefs.getBool('showSplash') ?? true;

    setState(() {
      _showSplash = showSplash;
    });

    if (showSplash) {
      await prefs.setBool('showSplash', false);

    }
  }

  @override
  Widget build(BuildContext context) {
    return _showSplash ? Introduction() : HomePage();
  }
}
