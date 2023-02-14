import 'package:flutter/material.dart';
import 'package:triplen_app/components/base_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginLayout extends StatefulWidget {
  LoginLayout({Key? key}) : super(key: key);

  @override
  State<LoginLayout> createState() => _LoginLayoutState();
}

class _LoginLayoutState extends State<LoginLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 100.h, right: 15.w, left: 15.w, bottom: 25.h),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 15.h),
                  child: Image.asset(
                    "assets/logo.png",
                    scale: 1,
                  ),
                ),
                Text(
                  "selamat datang di triplen!",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff009CE3),
                  ),
                ),
                Text(
                  "Triplen app membuat pengalaman liburanmu menjadi lebih seru dan menakjubkan.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff393939),
                  ),
                  textScaleFactor: 1.0,
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Your email',
                      labelText: 'Email *',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Your password',
                      labelText: 'Password *',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: BaseButton(
                    namaButton: "Sign In",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/* 
Flutter APP
  - MaterialApp
    - Scaffold
      - Widget

*/