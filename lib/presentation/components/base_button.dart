import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseButton extends StatelessWidget {
  final String? namaButton;
  final VoidCallback? onTap;

  BaseButton({Key? key, this.namaButton, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
