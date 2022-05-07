import 'package:food_order/data/repository/popular_product_repo.dart';
import 'package:food_order/models/products_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      print('Got products');
      _popularProductList = [];
      _popularProductList.addAll(Products.fromJson(response.body).products);
      print(_popularProductList);
      update();
    } else {}
  }
}
