import 'package:flutter/material.dart';
import '../appstyle/app_colors.dart';
import '../appstyle/app_dimensions.dart';
import '../appstyle/app_theme_styles.dart';

class ActionButtonWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String? text;

  const ActionButtonWidget({
    Key? key,
    this.onTap,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: AppDimensions.fifty,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.fifty),
              color: AppColors.orangeColor,
          ),
          child: Center(
            child: Text(text!,style: AppThemeStyles.whiteMedium16
            ),
          ),
        ),
      ),
    );
  }
}
