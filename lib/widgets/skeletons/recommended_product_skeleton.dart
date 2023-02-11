import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/widgets/skeletons/icon_and_text_skeleton.dart';
import 'package:gap/gap.dart';
import 'package:skeletons/skeletons.dart';

class RecommendedProductSkeleton extends StatelessWidget {
  const RecommendedProductSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10.h),
      child: Row(
        children: [
          SkeletonAvatar(
            style: SkeletonAvatarStyle(
                borderRadius: BorderRadius.circular(20.r),
                shape: BoxShape.rectangle,
                width: 120.w,
                height: 120.h),
          ),
          Expanded(
            child: Container(
              height: 100.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.r),
                      bottomRight: Radius.circular(20.r)),
                  color: Colors.white),
              child: Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SkeletonLine(
                      style: SkeletonLineStyle(
                          width: 0.5.sw,
                          height: 10.h,
                          borderRadius: BorderRadius.circular(8.r)),
                    ),
                    Gap(10.h),
                    SkeletonLine(
                      style: SkeletonLineStyle(
                          width: 0.3.sw,
                          height: 8.h,
                          borderRadius: BorderRadius.circular(8.r)),
                    ),
                    //const SkeletonLine(),
                    Gap(10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        IconAndTextSkeleton(),
                        IconAndTextSkeleton(),
                        IconAndTextSkeleton(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
