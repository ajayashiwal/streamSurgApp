import 'package:streamsurg/utils/app_strings.dart';
import '../../appStyle/assets_images.dart';

class SlideScreenContent {
  late String image;
  late String name;
  late String des;
  SlideScreenContent(this.image, this.name, this.des);
}

List<SlideScreenContent> contents = [
  SlideScreenContent(
      AssetsBase.slideFrame1,
      AppStrings.slideFrameTitle1,
      AppStrings.slideFrameDis1
  ),
  SlideScreenContent(
      AssetsBase.slideFrame2,
      AppStrings.slideFrameTitle2,
    AppStrings.slideFrameDis1
  ),
  SlideScreenContent(
      AssetsBase.slideFrame3,
      AppStrings.slideFrameTitle3,
      AppStrings.slideFrameDis1
  ),

];
