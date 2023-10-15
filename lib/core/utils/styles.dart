import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/widgets.dart';

abstract class Styles {
  static const montserratSemiBold14 = TextStyle(
      color: kYellowColor,
      fontSize: 14,
      fontFamily: AssetsData.montserratSemiBold);
  static const montserratSemiBold18 = TextStyle(
      color: kYellowColor,
      fontSize: 18,
      fontFamily: AssetsData.montserratSemiBold);
  static const gTSectra20 =
      TextStyle(fontSize: 20, fontFamily: AssetsData.gTSectra);
  static const gTSectra30 =
      TextStyle(fontSize: 30, fontFamily: AssetsData.gTSectra);
  static const montserratMedium14 = TextStyle(
      color: kGreyColor, fontSize: 14, fontFamily: AssetsData.montserratMedium);
  static const montserratMedium18 = TextStyle(
      color: kGreyColor, fontSize: 18, fontFamily: AssetsData.montserratMedium);
  static const montserratRegular14 = TextStyle(
      color: kGreyColor,
      fontSize: 14,
      fontFamily: AssetsData.montserratRegular);
  static const montserratBold15 =
      TextStyle(fontSize: 15, fontFamily: AssetsData.montserratBold);
  static const montserratBold16 = TextStyle(
      color: kPrimaryColor,
      fontSize: 15,
      fontFamily: AssetsData.montserratBold);
  static const montserratMedium16 =
      TextStyle(fontSize: 16, fontFamily: AssetsData.montserratMedium);
}
