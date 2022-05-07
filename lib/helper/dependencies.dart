import 'package:food_order/controllers/popular_product_controller.dart';
import 'package:food_order/data/api/api_client.dart';
import 'package:food_order/data/repository/popular_product_repo.dart';
import 'package:food_order/utils/api_docs.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //Api client
  Get.lazyPut(() => ApiClient(appBaseUrl: ApiDocs.BASE_URL));
  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
