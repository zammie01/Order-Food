import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight / 2.64;
  static double pageViewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 7.03;
//Dynamic height for padding and margin
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.13;
  static double height35 = screenHeight / 24.1;
  static double height45 = screenHeight / 18.76;
  //Dynamic width for padding and margin
  static double width10 = screenHeight / 84.4;
  static double width15 = screenHeight / 56.27;
  static double width20 = screenHeight / 42.2;
  static double width30 = screenHeight / 28.13;
//font size
  static double font26 = screenHeight / 32.46;
  static double font20 = screenHeight / 42.2;
  static double font16 = screenHeight / 52.75;
  static double font12 = screenHeight / 70.3;
//Dynamic Radius
  static double radius15 = screenHeight / 56.27;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.1;
//Icon Size
  static double iconSize24 = screenHeight / 35.17;
  static double starIcon = screenHeight / 56.27;
  static double iconSize16 = screenHeight / 52.75;
//Box image and text for popular
  static double boxImageHeight = screenHeight / 7.03;
  static double boxTextHeight = screenHeight / 8.44;
  static double boxImageWidth = screenHeight / 7.03;
//List view size
  static double listViewImage = screenWidth / 3.25;
  static double listViewTextSize = screenWidth / 3.9;

//Popular food details
  static double popularFoodImgSize = screenHeight / 2.41;

//bottom height
  static double bottomHeightBar = screenHeight / 7.03;
}
