import 'package:food_order/data/api/api_client.dart';
import 'package:food_order/utils/api_docs.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData(ApiDocs.POPULAR_PRODUCTS_URI);
  }
}
