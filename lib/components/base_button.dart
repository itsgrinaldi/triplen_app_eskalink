import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:triplen_app/layout/home_layout.dart';
import 'package:triplen_app/layout/main_layout.dart';

class BaseButton extends StatelessWidget {
  final String? namaButton;

  BaseButton({Key? key, this.namaButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MainLayout()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55.h,
        padding: EdgeInsets.symmetric(vertical: 8.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: const Color(0xffE4E4E4), width: 1)),
        child: Text(
          namaButton!,
          style: TextStyle(
            color: Color(0xff393939),
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}
