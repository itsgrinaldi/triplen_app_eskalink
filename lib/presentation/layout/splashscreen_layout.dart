import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:triplen_app/presentation/layout/login_layout.dart';
import 'package:triplen_app/presentation/layout/main_layout.dart';
import 'package:triplen_app/di.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SharedPreferences preferences;

  @override
  void initState() {
    preferences = sl<SharedPreferences>();

    const current = Duration(seconds: 3);
    Timer(
        current,
        () {
          if (preferences.getString("isLogin") == "1") {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => MainLayout()));
          } else {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LoginLayout()));
          }
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 15),
              child: Image.asset(
                "assets/logo.png",
                scale: 1,
              ),
            ),
            const Text(
              "triplen",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
