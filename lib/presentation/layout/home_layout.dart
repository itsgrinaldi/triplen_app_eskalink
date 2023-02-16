import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeLayout extends StatefulWidget {
  HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 25.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 25.w, top: 15.h),
                    child: Text(
                      "Rencana-Ku",
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    width: 150.w,
                    margin: EdgeInsets.only(top: 15.h),
                    padding:
                        EdgeInsets.only(right: 25.w, top: 10.h, bottom: 10.h),
                    decoration: BoxDecoration(
                        color: Color(0xff40BEF9),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(50))),
                    child: Text(
                      "1231273",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(
                    top: 15.h, bottom: 8.h, left: 25.w, right: 25.w),
                itemCount: 25,
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 5.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Liburan ke Bali",
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Color(0xff009BE7),
                              ),
                            ),
                            Text(
                              "Liburan mulai tanggal 30 Januari",
                            ),
                          ],
                        ),
                        Container(
                          child: Text(
                            "30 Jan",
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
