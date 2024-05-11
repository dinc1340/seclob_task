import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({
    super.key,
    required this.count,
    required this.details,
  });
  final int count;
  final String details;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          textAlign: TextAlign.center,
          "${count}",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins",
              fontSize: 18.sp,
              color: Color(0xff1E3167)),
        ),
        Text(
          textAlign: TextAlign.center,
          details,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins",
              fontSize: 12.sp,
              color: Color(0xff1E3167).withOpacity(.6)),
        ),
      ],
    );
  }
}
