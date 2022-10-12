library Constants;
import 'package:flutter/material.dart';
import 'package:get/get.dart';


// class Constants {

   const Duration smallDuration = Duration(milliseconds: 100);
   const Duration duration = Duration(milliseconds: 300);
   const int transitionTime = 300;

   double get smallIconSize => Get.width * .05;
   double get iconSize => Get.width * .08;
   double get largeIconSize => Get.width * .12;

   double get smallHorizontalPadding => Get.width * .02;
   double get horizontalPadding => Get.width * .04;
   double get largeHorizontalPadding => Get.width * .06;

   double get smallVerticalPadding => Get.height * .01;
   double get verticalPadding => Get.height * .02;
   double get largeVerticalPadding => Get.height * .02;

   double get extraSmallRadius => Get.width * .014;
   double get smallRadius => Get.width * .03;
   double get radius => Get.width * .04;

   EdgeInsets get smallDefaultPadding => EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: smallVerticalPadding);
   EdgeInsets get defaultPadding => EdgeInsets.symmetric(horizontal: largeHorizontalPadding, vertical: verticalPadding);

// }