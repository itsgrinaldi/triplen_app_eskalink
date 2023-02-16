import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:triplen_app/presentation/layout/home_layout.dart';

class MainLayout extends StatefulWidget {
  MainLayout({Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: counter == 0
            ? HomeLayout()
            : counter == 1
                ? Container()
                : counter == 2
                    ? Container()
                    : counter == 3
                        ? Container()
                        : Container(),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    counter = 0;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  child: Icon(
                    Icons.home,
                    color: counter == 0 ? Color(0xff64CEFF) : Color(0xffB6B6B6),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    counter = 1;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  child: Icon(
                    Icons.history,
                    color: counter == 1 ? Color(0xff64CEFF) : Color(0xffB6B6B6),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    counter = 2;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  child: Icon(
                    Icons.newspaper,
                    color: counter == 2 ? Color(0xff64CEFF) : Color(0xffB6B6B6),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    counter = 3;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  child: Icon(
                    Icons.account_box,
                    color: counter == 3 ? Color(0xff64CEFF) : Color(0xffB6B6B6),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
