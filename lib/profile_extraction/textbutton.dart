import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Textbutton extends StatelessWidget {
  const Textbutton({
    super.key,
    required this.title,
    required this.color,
  });
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: 145.w,
      child: TextButton(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r)),
              backgroundColor: color),
          onPressed: () {},
          child: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: "Poppins",
                fontSize: 14.sp,
                color: const Color(0xffffffff)),
          )),
    );
  }
}
