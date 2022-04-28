import 'package:food_order/data/api/api_client.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiCLient apiCLient;

  PopularProductRepo({required this.apiCLient});

  Future<Response> getPopularProductList() async {
    return await apiCLient
        .getData("http://mvs.bslmeiyu.com/api/v1/products/popular");
  }
}
