import 'package:food_order/controllers/popular_product_controller.dart';
import 'package:food_order/data/api/api_client.dart';
import 'package:food_order/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //Api client
  Get.lazyPut(() => ApiCLient(appBaseUrl: "https://www.dbestech.com"));
  //repos
  Get.lazyPut(() => PopularProductRepo(apiCLient: Get.find()));
  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
