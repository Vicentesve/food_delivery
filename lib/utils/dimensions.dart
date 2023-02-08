import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Dimensions {
  static getSize(BuildContext context) => MediaQuery.of(context).size;

  static getScreenHeight() => Get.height;

  static getScreenWidth() => Get.width;

  static getHeight(double pixels) =>
      getScreenHeight() / (getScreenHeight() / pixels);

  static getWidth(double pixels) =>
      getScreenWidth() / (getScreenWidth() / pixels);
}
