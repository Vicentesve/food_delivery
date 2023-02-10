import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:gap/gap.dart';

import '../utils/colors.dart';
import 'big_text.dart';
import 'icon_and_text.dart';

class AppColumnFood extends StatelessWidget {
  final String nameFood;
  final int stars;
  const AppColumnFood({super.key, required this.nameFood, required this.stars});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: nameFood,
          size: 26.sp,
        ),
        Gap(10.h),
        Row(
          children: [
            Wrap(
              children: List.generate(
                  stars,
                  (index) => Icon(
                        Icons.star,
                        color: AppColors.mainColor,
                        size: 15.h,
                      )),
            ),
            Gap(10.h),
            SmallText(text: stars.toString()),
            Gap(10.h),
            const SmallText(text: '1287 comments'),
          ],
        ),
        Gap(20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            IconAndText(
              icon: Icons.circle_sharp,
              text: 'Normal',
              iconColor: AppColors.iconColor1,
            ),
            IconAndText(
              icon: Icons.location_on,
              text: '1.7 km',
              iconColor: AppColors.mainColor,
            ),
            IconAndText(
              icon: Icons.access_time_rounded,
              text: '32 min',
              iconColor: AppColors.iconColor2,
            ),
          ],
        ),
      ],
    );
  }
}
