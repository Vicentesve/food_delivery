import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/app_column_food.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:gap/gap.dart';

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
        SizedBox(
          height: 320.h,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        DotsIndicator(
          dotsCount: 5,
          position: _currPageVal,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: Size.square(9.0.r),
            activeSize: Size(18.0.w, 9.0.h),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5).r),
          ),
        ),
        Gap(30.h),
        Container(
          margin: EdgeInsets.only(left: 30.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const BigText(text: 'Popular'),
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
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
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
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/image/food0.png')),
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
                                text: 'Nutritious fruit meal in China',
                                size: 16.h,
                              ),
                              Gap(10.h),
                              const SmallText(
                                  text: 'With chinese characteristics'),
                              Gap(10.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                    )
                  ],
                ),
              );
            }),
      ],
    );
  }

  Widget _buildPageItem(int index) {
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
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/image/food0.png'),
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120.h,
              margin: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 30.h),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: const Color(0xffe8e8e8),
                    blurRadius: 5.0.r,
                    offset: Offset(0, 5.h)),
                BoxShadow(color: Colors.white, offset: Offset(-5.w, 0)),
                BoxShadow(color: Colors.white, offset: Offset(5.w, 0)),
              ], borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Container(
                padding: EdgeInsets.only(top: 15.h, left: 15.w, right: 15.w),
                child: const AppColumnFood(
                  nameFood: 'Chinese Side',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
