import 'dart:async';

import 'package:flutter/material.dart';
import 'package:triplen_app/layout/login_layout.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    const current = Duration(seconds: 3);
    Timer(
        current,
        () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => LoginLayout())));
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
