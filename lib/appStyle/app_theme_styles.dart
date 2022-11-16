




import 'package:flutter/material.dart';
import 'package:streamsurg/appStyle/app_colors.dart';
import 'package:streamsurg/appStyle/app_dimensions.dart';
import 'package:streamsurg/appStyle/app_fonts.dart';

abstract class AppThemeStyles {
  static TextStyle whiteBold43 = TextStyle(
      fontSize: AppDimensions.fortyThree,
      fontFamily: AppFonts.appBerlinSansFBDemiBoldFontFamily,
      color: AppColors.whiteColor
  );
  static TextStyle redBold43 = TextStyle(
      fontSize: AppDimensions.fortyThree,
      fontFamily: AppFonts.appBerlinSansFBDemiBoldFontFamily,
      color: AppColors.redColor
  );
  static TextStyle whiteMedium16 = TextStyle(
      color: AppColors.whiteColor,
      fontFamily: AppFonts.appArticoCufonMediumFontFamily,
      fontSize: AppDimensions.sixTeen
  );
  static TextStyle darkGreyMedium18 = TextStyle(
      color: AppColors.darkGreyColor,
      fontFamily: AppFonts.appArticoCufonMediumFontFamily,
      fontSize: AppDimensions.eighteen
  );
  static TextStyle whiteMedium18 = TextStyle(
      color: AppColors.whiteColor,
      fontFamily: AppFonts.appArticoCufonMediumFontFamily,
      fontSize: AppDimensions.eighteen
  );
  static TextStyle blackMedium16 = TextStyle(
      color: AppColors.blackColor,
      fontFamily: AppFonts.appArticoCufonMediumFontFamily,
      fontSize: AppDimensions.sixTeen
  );
  static TextStyle whiteLightUnderLine16 = TextStyle(
    fontFamily: AppFonts.appCretypeArticoCondensedLightFontFamily,
    fontSize: AppDimensions.sixTeen,
    color: AppColors.whiteColor.withOpacity(0.6),
    decoration: TextDecoration.underline,
  );
  static TextStyle whiteBold24 = TextStyle(
    fontFamily: AppFonts.appArticoCufonBoldFontFamily,
    fontSize: AppDimensions.twentyFour,
    color: AppColors.whiteColor,
  );
  static TextStyle whiteLight16 = TextStyle(
    fontFamily: AppFonts.appCretypeArticoCondensedLightFontFamily,
    fontSize: AppDimensions.sixTeen,
    color: AppColors.whiteColor,
  );
  static TextStyle blackLight24 = TextStyle(
      fontSize: AppDimensions.twentyFour,
      fontFamily: AppFonts.appArticoCufonMediumFontFamily,
      color: AppColors.blackLightColor
  );
  static TextStyle blackLight14 = TextStyle(
      fontSize: AppDimensions.forTeen,
      fontFamily: AppFonts.appCretypeArticoNormalFontFamily,
      color: AppColors.blackColor.withOpacity(0.5)
  );
  static TextStyle blackLight12 = TextStyle(
      fontSize: AppDimensions.twelve,
      fontFamily: AppFonts.appCretypeArticoNormalFontFamily,
      color: AppColors.blackColor.withOpacity(0.5)
  );
  static TextStyle blackLight16 = TextStyle(
      fontSize: AppDimensions.sixTeen,
      fontFamily: AppFonts.appCretypeArticoNormalFontFamily,
      color: AppColors.blackColor.withOpacity(0.5)
  );
  static TextStyle blackLightColor16 = TextStyle(
      fontSize: AppDimensions.sixTeen,
      fontFamily: AppFonts.appArticoCufonMediumFontFamily,
      color: AppColors.blackLightColor
  );

  static TextStyle blackLightMedium16 = TextStyle(
      fontSize: AppDimensions.sixTeen,
      fontFamily: AppFonts.appArticoCufonMediumFontFamily,
      color: AppColors.blackColor.withOpacity(0.5)
  );
  static TextStyle greyLight16 = TextStyle(
      fontSize: AppDimensions.sixTeen,
      fontFamily: AppFonts.appCretypeArticoNormalFontFamily,
      color: AppColors.greyLightColor
  );
  static TextStyle greyLight14 = TextStyle(
      fontSize: AppDimensions.forTeen,
      fontFamily: AppFonts.appCretypeArticoNormalFontFamily,
      color: AppColors.greyLightColor
  );
  static TextStyle black16 = TextStyle(
      color: AppColors.blackColor,
      fontFamily: AppFonts.appArticoCufonMediumFontFamily,
      fontSize: AppDimensions.sixTeen
  );
  static TextStyle black14 = TextStyle(
      color: AppColors.blackColor,
      fontFamily: AppFonts.appCretypeArticoNormalFontFamily,
      fontSize: AppDimensions.forTeen
  );
  static TextStyle blackMedium14 = TextStyle(
      color: AppColors.blackColor,
      fontFamily: AppFonts.appArticoCufonMediumFontFamily,
      fontSize: AppDimensions.forTeen
  );
  static TextStyle black18 = TextStyle(
      color: AppColors.blackColor,
      fontFamily: AppFonts.appArticoCufonMediumFontFamily,
      fontSize: AppDimensions.eighteen
  );
  static TextStyle blackLight18 = TextStyle(
      color: AppColors.blackLightColor,
      fontFamily: AppFonts.appArticoCufonMediumFontFamily,
      fontSize: AppDimensions.eighteen
  );
  static TextStyle blackLightBold18 = TextStyle(
      color: AppColors.blackLightColor,
      fontFamily: AppFonts.appArticoCufonBoldFontFamily,
      fontSize: AppDimensions.eighteen
  );
  static TextStyle orangeLightBold18 = TextStyle(
      color: AppColors.orangeColor,
      fontFamily: AppFonts.appArticoCufonBoldFontFamily,
      fontSize: AppDimensions.eighteen
  );
  static TextStyle orangeUnderLine14 = TextStyle(
    fontFamily: AppFonts.appCretypeArticoNormalFontFamily,
    fontSize: AppDimensions.forTeen,
    color: AppColors.orangeColor,
    decoration: TextDecoration.underline,
  );
  static TextStyle greyLight18 = TextStyle(
      fontSize: AppDimensions.eighteen,
      fontFamily: AppFonts.appCretypeArticoNormalFontFamily,
      color: AppColors.greyLightColor
  );
  static TextStyle orange12 = TextStyle(
      fontSize: AppDimensions.twelve,
      fontFamily: AppFonts.appArticoCufonMediumFontFamily,
      color: AppColors.orangeColor
  );
  static TextStyle black12 = TextStyle(
      fontSize: AppDimensions.twelve,
      fontFamily: AppFonts.appArticoCufonMediumFontFamily,
      color: AppColors.blackColor
  );
  static TextStyle red14 = TextStyle(
      color: AppColors.redColor,
      fontSize: AppDimensions.forTeen,
      fontFamily: AppFonts.appArticoCufonBoldFontFamily
  );
  static TextStyle red16 = TextStyle(
      color: AppColors.redColor,
      fontSize: AppDimensions.sixTeen,
      fontFamily: AppFonts.appCretypeArticoNormalFontFamily
  );
  static TextStyle blackLightColor14 = TextStyle(
      color: AppColors.blackLightColor,
      fontSize: AppDimensions.forTeen,
      fontFamily: AppFonts.appArticoCufonBoldFontFamily
  );

}
