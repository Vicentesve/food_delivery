import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
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
          height: Dimensions.getHeight(320),
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
            size: Size.square(Dimensions.getHeight(9.0)),
            activeSize:
                Size(Dimensions.getWidth(18.0), Dimensions.getHeight(9.0)),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.getHeight(5.0))),
          ),
        )
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
            height: Dimensions.getHeight(220),
            margin: EdgeInsets.symmetric(horizontal: Dimensions.getWidth(10)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.getHeight(30)),
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
              height: Dimensions.getHeight(120),
              margin: EdgeInsets.only(
                  left: Dimensions.getWidth(30),
                  right: Dimensions.getWidth(30),
                  bottom: Dimensions.getHeight(30)),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0xffe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0, Dimensions.getHeight(5))),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(Dimensions.getWidth(-5), 0)),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(Dimensions.getWidth(5), 0)),
                  ],
                  borderRadius: BorderRadius.circular(Dimensions.getHeight(20)),
                  color: Colors.white),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.getHeight(15),
                    left: Dimensions.getWidth(15),
                    right: Dimensions.getWidth(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BigText(text: 'Chinese Side'),
                    Gap(Dimensions.getHeight(10)),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                              5,
                              (index) => const Icon(
                                    Icons.star,
                                    color: AppColors.mainColor,
                                    size: 15,
                                  )),
                        ),
                        Gap(Dimensions.getHeight(10)),
                        const SmallText(text: '4.5'),
                        Gap(Dimensions.getHeight(10)),
                        const SmallText(text: '1287 comments'),
                      ],
                    ),
                    Gap(Dimensions.getHeight(20)),
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
