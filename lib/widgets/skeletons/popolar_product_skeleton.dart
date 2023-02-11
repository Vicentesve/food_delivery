import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletons/skeletons.dart';

class PopularProductSkeleton extends StatelessWidget {
  const PopularProductSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          child: SkeletonAvatar(
            style: SkeletonAvatarStyle(
              height: 220.h,
              width: double.infinity,
              borderRadius: BorderRadius.circular(30).r,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SkeletonAvatar(
            style: SkeletonAvatarStyle(
              height: 120.h,
              padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 30.h),
              width: double.infinity,
              borderRadius: BorderRadius.circular(20).r,
            ),
          ),
        )
      ],
    );
  }
}
