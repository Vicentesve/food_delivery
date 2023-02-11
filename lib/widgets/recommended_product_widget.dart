import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/models/popular_product_model.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:gap/gap.dart';

import '../utils/app_constants.dart';
import '../utils/colors.dart';
import 'big_text.dart';
import 'icon_and_text.dart';

class RecommendedProductWidget extends StatelessWidget {
  final ProductModel recommendedProduct;
  const RecommendedProductWidget({super.key, required this.recommendedProduct});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10.h),
      child: Row(
        children: [
          // Show Image
          Container(
            width: 120.w,
            height: 120.h,
            decoration: BoxDecoration(
                color: Colors.white38,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        '${AppConstants.BASE_URL}/uploads/${recommendedProduct.img!}')),
                borderRadius: BorderRadius.circular(20).r),
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
                    BigText(
                      text: recommendedProduct.name.toString(),
                      size: 16.h,
                    ),
                    Gap(10.h),
                    SmallText(text: recommendedProduct.description.toString()),
                    Gap(10.h),
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
