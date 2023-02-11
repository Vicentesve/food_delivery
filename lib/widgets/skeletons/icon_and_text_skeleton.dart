import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:skeletons/skeletons.dart';

class IconAndTextSkeleton extends StatelessWidget {
  const IconAndTextSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SkeletonAvatar(
          style: SkeletonAvatarStyle(
            shape: BoxShape.circle,
            height: 20.h,
            width: 20.h,
          ),
        ),
        Gap(5.h),
        SkeletonLine(
          style: SkeletonLineStyle(
              width: 0.1.sw,
              height: 8.h,
              borderRadius: BorderRadius.circular(8.r)),
        ),
      ],
    );
  }
}
