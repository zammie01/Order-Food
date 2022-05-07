import 'package:food_order/data/api/api_client.dart';
import 'package:food_order/utils/api_docs.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(ApiDocs.RECOMMENDED_PRODUCTS_URI);
  }
}
