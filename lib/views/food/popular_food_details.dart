import 'package:flutter/material.dart';
import 'package:food_order/controllers/cart_controller.dart';
import 'package:food_order/controllers/popular_product_controller.dart';
import 'package:food_order/utils/api_docs.dart';
import 'package:food_order/utils/colors.dart';
import 'package:food_order/utils/dimesions.dart';
import 'package:food_order/widgets/app_column.dart';
import 'package:food_order/widgets/app_icons.dart';
import 'package:food_order/widgets/big_text.dart';
import 'package:food_order/widgets/expandable_text.dart';
import 'package:get/get.dart';

class PopularFoodDetails extends StatelessWidget {
  int pageId;
  PopularFoodDetails({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      ApiDocs.BASE_URL + ApiDocs.UPLOAD_URL + product.img!),
                ),
              ),
            ),
          ),
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: AppIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.black,
                  ),
                ),
                GetBuilder<PopularProductController>(builder: (controller) {
                  return Stack(
                    children: [
                      AppIcon(
                        icon: Icons.shopping_cart_outlined,
                        iconColor: Colors.black,
                      ),
                      Get.find<PopularProductController>().totalItems >= 1
                          ? Positioned(
                              right: 0,
                              top: 0,
                              child: AppIcon(
                                  icon: Icons.circle,
                                  size: 20,
                                  iconColor: Colors.transparent,
                                  backgroundColor: AppColors.mainColor),
                            )
                          : Container(),
                      Get.find<PopularProductController>().totalItems >= 1
                          ? Positioned(
                              right: 6,
                              top: 3,
                              child: BigText(
                                text: Get.find<PopularProductController>()
                                    .totalItems
                                    .toString(),
                                size: 12,
                                color: Colors.white,
                              ),
                            )
                          : Container()
                    ],
                  );
                })
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImgSize - 20,
            child: Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                top: Dimensions.height20,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: product.name!),
                  SizedBox(height: Dimensions.height20),
                  BigText(text: "Introduce"),
                  SizedBox(height: Dimensions.height20),
                  Expanded(
                      child: SingleChildScrollView(
                    child: ExpandableText(text: product.description!),
                  ))
                ],
              ),
            ),
          )
        ],
      ),
      //this is the bottom navigation
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (popularProduct) {
          return Container(
            height: Dimensions.bottomHeightBar,
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
                vertical: Dimensions.width20, horizontal: Dimensions.height20),
            decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(Dimensions.radius20 * 2),
                topLeft: Radius.circular(Dimensions.radius20 * 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          popularProduct.setQuantity(false);
                        },
                        child: Icon(Icons.remove, color: AppColors.signColor),
                      ),
                      SizedBox(width: Dimensions.width10 / 2),
                      BigText(text: popularProduct.inCartItems.toString()),
                      SizedBox(width: Dimensions.width10 / 2),
                      GestureDetector(
                        onTap: () {
                          popularProduct.setQuantity(true);
                        },
                        child: Icon(Icons.add, color: AppColors.signColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: Dimensions.width10),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius20)),
                  child: GestureDetector(
                    onTap: () {
                      popularProduct.addItem(product);
                    },
                    child: BigText(
                        text: "\$ ${product.price!} | Add to cart",
                        color: Colors.white),
                  ),
                )),
              ],
            ),
          );
        },
      ),
    );
  }
}
