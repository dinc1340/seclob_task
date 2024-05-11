import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:seclob_task/Services/apimodel.dart';
import 'package:seclob_task/profile_extraction/profiledetails.dart';
import 'package:seclob_task/profile_extraction/textbutton.dart';
import 'package:seclob_task/models/usermodel.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserDeatailsClass? data;

  @override
  void initState() {
    getData();

    super.initState();
  }

  getData() async {
    data = await getUserData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(scrolledUnderElevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: Image.asset(
            "asset/images/next.png",
            height: 32.h,
            width: 32.w,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 24.w),
            child: Image.asset(
              "asset/images/list.png",
              height: 32.h,
              width: 32.w,
            ),
          )
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r), topRight: Radius.circular(12.r)),
        child: Container(
          height: 62.h,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 4.sp,
                  color: Colors.white.withOpacity(.25),
                  offset: Offset(0, 4.h),
                )
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r),
              )),
          child: NavigationBar(
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            backgroundColor:const Color(0xff1E2E5D),
            indicatorColor: Colors.transparent,
            destinations: [
              NavigationDestination(
                  enabled: true,
                  icon: Image.asset(
                    "asset/images/home.png",
                    height: 21.h,
                    width: 21.w,
                  ),
                  label: ""),
              NavigationDestination(
                  icon: Image.asset(
                    "asset/images/search.png",
                    height: 19.h,
                    width: 19.w,
                  ),
                  label: ""),
              NavigationDestination(
                  icon: Image.asset(
                    "asset/images/camara.png",
                    height: 25.h,
                    width: 22.w,
                  ),
                  label: ""),
              NavigationDestination(
                icon: Image.asset(
                  "asset/images/video.png",
                  height: 21.h,
                  width: 21.w,
                ),
                label: "",
              ),
              NavigationDestination(
                  icon: Padding(
                    padding: EdgeInsets.only(top: 19.h),
                    child: Column(
                      children: [
                        Image.asset(
                          "asset/images/person.png",
                          height: 22.h,
                          width: 22.w,
                        ),
                        Gap(5.h),
                        Icon(
                          Icons.maximize,
                          color: Colors.white,
                          size: 14.sp,
                        )
                      ],
                    ),
                  ),
                  label: ""),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 22.w, right: 31.w, top: 19.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (data != null)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(42.r),
                      child: Image.network(
                        data!.media!.first.profilePic!,
                        height: 86.h,
                        width: 86.w,
                      ),
                    ),
                  ProfileDetails(
                    count: data != null ? data!.postCount!.toInt() : 0,
                    details: "Post",
                  ),
                  ProfileDetails(
                    count: 564,
                    details: "Followers",
                  ),
                  ProfileDetails(
                    count: 564,
                    details: "Following",
                  ),
                ],
              ),
            ),
            Gap(6.h),
            Padding(
              padding: EdgeInsets.only(left: 22.w, right: 23.w, bottom: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    data != null
                        ? "${data!.media!.first.firstName} ${data!.media!.first.lastName}"
                        : "",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                        fontSize: 14.sp,
                        color:const Color(0xff1E3167)),
                  ),
                  Gap(6.h),
                  Text(
                    textAlign: TextAlign.center,
                    "Photographer",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: "Poppins",
                        fontSize: 10.sp,
                        color: const Color(0xff1E3167)),
                  ),
                  Gap(6.h),
                  Text(
                    textAlign: TextAlign.center,
                    "🌟 You are beautiful, and\n I'm here to capture it! 🌟",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontFamily: "Poppins",
                        fontSize: 12.sp,
                        color: const Color(0xff1E3167)),
                  ),
                  Gap(6.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Textbutton(
                        title: "Edit profile",
                        color: Color(0xff184AC0),
                      ),
                      const Textbutton(
                        title: "Wallet",
                        color: Color(0xff28426B),
                      ),
                      SizedBox(
                          height: 40.h,
                          width: 43.w,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  backgroundColor:
                                      const Color(0xff5B7ED2).withOpacity(.71)),
                              onPressed: () {},
                              child: Image.asset("asset/images/phone.png")))
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.black.withOpacity(.09),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Photos",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      fontSize: 12.sp,
                      color:const Color(0xffA7ACD0)),
                ),
                SizedBox(
                  width: 1,
                  height: 18,
                  child: VerticalDivider(
                    color:const Color(0xffA7ACD04F).withOpacity(.31),
                  ),
                ),
                Text(
                  "Videos",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      fontSize: 12.sp,
                      color: const Color(0xffA7ACD0)),
                )
              ],
            ),
            Divider(
              color: Colors.black.withOpacity(.09),
            ),
            data == null
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding:
                        EdgeInsets.only(left: 5.w, right: 6.w, bottom: 10.h),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8.w,
                          mainAxisSpacing: 8.h),
                      itemBuilder: (context, index) {
                        return Container(
                          clipBehavior: Clip.hardEdge,
                          child: Center(
                            child: Stack(
                              children: [
                                Image.network(
                                  data!.media![index].filePath.toString(),
                                  height:
                                      MediaQuery.of(context).size.height * .25,
                                  width:
                                      MediaQuery.of(context).size.width * .33,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  bottom: 5.h,
                                  left: 34.w,
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Image.asset(
                                            "asset/images/like.png",
                                            height: 15.h,
                                            width: 17.w,
                                          ),
                                          Gap(2.h),
                                          if (data != null)
                                            Text(
                                              data!.media![index].likeCount
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontFamily: "Poppins",
                                                  fontSize: 8.sp,
                                                  color: Colors.white),
                                            )
                                        ],
                                      ),
                                      Gap(21.w),
                                      Column(
                                        children: [
                                          Image.asset(
                                            "asset/images/commend.png",
                                            height: 15.h,
                                            width: 17.w,
                                          ),
                                          Gap(2.h),
                                          if (data != null)
                                            Text(
                                              data!.media![index].commentCount
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontFamily: "Poppins",
                                                  fontSize: 8.sp,
                                                  color: Colors.white),
                                            )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          height: MediaQuery.of(context).size.height * .25,
                          width: MediaQuery.of(context).size.width * .33,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        );
                      },
                      itemCount: data!.media!.length,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
