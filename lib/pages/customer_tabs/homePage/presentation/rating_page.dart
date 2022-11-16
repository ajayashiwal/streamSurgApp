import 'package:flutter/material.dart';
import 'package:streamsurg/appStyle/app_colors.dart';
import 'package:streamsurg/appStyle/app_dimensions.dart';

typedef RatingChangeCallback = void Function(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback? onRatingChanged;
  final Color? color;

  const StarRating({Key? key, this.starCount = 5, this.rating = .0, this.onRatingChanged, this.color}) : super(key: key);

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon =  Icon(
        Icons.star,
        // ignore: deprecated_member_use
        color: AppColors.greyLightColor,
        size: AppDimensions.eighteen,
      );
    }
    else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        color: color ?? Theme.of(context).primaryColor,
        size: AppDimensions.eighteen,

      );
    } else {
      icon =  Icon(
        Icons.star,
        size: AppDimensions.eighteen,

        color: AppColors.yellowColor,
      );
    }
    return InkResponse(
      onTap: onRatingChanged == null ? null : () => onRatingChanged!(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: List.generate(starCount, (index) => buildStar(context, index)));
  }
}