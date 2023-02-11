import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/models/popular_product_model.dart';
import 'package:food_delivery/pages/food/popular_food_detail.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/app_column_food.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/recommended_product_widget.dart';
import 'package:food_delivery/widgets/skeletons/popolar_product_skeleton.dart';
import 'package:food_delivery/widgets/skeletons/recommended_product_skeleton.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../controllers/popular_product_controller.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);

  var _currPageVal = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = 220.0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageVal = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return SizedBox(
            height: 320.h,
            child: popularProducts.isLoading
                ? PageView.builder(
                    controller: pageController,
                    itemCount: 2,
                    itemBuilder: (context, index) =>
                        const PopularProductSkeleton(),
                  )
                : GestureDetector(
                    onTap: () {
                      Get.to(() => const PopularFoodDetail());
                    },
                    child: PageView.builder(
                        controller: pageController,
                        itemCount: popularProducts.popularProductList.isEmpty
                            ? 5
                            : popularProducts.popularProductList.length,
                        itemBuilder: (context, position) {
                          return _buildPageItem(position,
                              popularProducts.popularProductList[position]);
                        }),
                  ),
          );
        }),
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty
                ? 5
                : popularProducts.popularProductList.length,
            position: _currPageVal,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: Size.square(9.0.r),
              activeSize: Size(18.0.w, 9.0.h),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5).r),
            ),
          );
        }),
        Gap(30.h),
        Container(
          margin: EdgeInsets.only(left: 30.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const BigText(text: 'Recommended'),
              Gap(10.h),
              Container(
                margin: EdgeInsets.only(bottom: 3.h),
                child: const BigText(
                  text: '.',
                  color: Colors.black26,
                ),
              ),
              Gap(10.h),
              Container(
                margin: EdgeInsets.only(bottom: 2.h),
                child: const SmallText(text: 'Food pairing'),
              ),
            ],
          ),
        ),
        Gap(20.h),
        GetBuilder<RecommendedProductController>(
            builder: (recommendedProducts) {
          return recommendedProducts.isLoading2
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const RecommendedProductSkeleton();
                  })
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: recommendedProducts.recommendedProductList.length,
                  itemBuilder: (context, index) {
                    return RecommendedProductWidget(
                        recommendedProduct:
                            recommendedProducts.recommendedProductList[index]);
                  });
        }),
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    Matrix4 matrix = Matrix4.identity();

    if (index == _currPageVal.floor()) {
      var currScale = 1 - (_currPageVal - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageVal.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageVal - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageVal.floor() - 1) {
      var currScale = 1 - (_currPageVal - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: 220.h,
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30).r,
                color: index.isEven
                    ? const Color(0xff69c5df)
                    : const Color(0xff9294cc),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      '${AppConstants.BASE_URL}/uploads/${popularProduct.img!}'),
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120.h,
              margin: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 30.h),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0xffe8e8e8),
                        blurRadius: 5.0.r,
                        offset: Offset(0, 5.h)),
                    BoxShadow(color: Colors.white, offset: Offset(-5.w, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5.w, 0)),
                  ],
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.white),
              child: Container(
                padding: EdgeInsets.only(top: 15.h, left: 15.w, right: 15.w),
                child: AppColumnFood(
                  nameFood: popularProduct.name.toString(),
                  stars: popularProduct.stars!.toInt(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
