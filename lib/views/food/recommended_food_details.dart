import 'package:flutter/material.dart';
import 'package:food_order/controllers/cart_controller.dart';
import 'package:food_order/controllers/popular_product_controller.dart';
import 'package:food_order/controllers/recommended_product_controller.dart';
import 'package:food_order/routes/route_helper.dart';
import 'package:food_order/utils/api_docs.dart';
import 'package:food_order/utils/colors.dart';
import 'package:food_order/utils/dimesions.dart';
import 'package:food_order/widgets/app_icons.dart';
import 'package:food_order/widgets/big_text.dart';
import 'package:food_order/widgets/expandable_text.dart';
import 'package:get/get.dart';

class RecommendedFoodDetails extends StatelessWidget {
  int pageId;
  RecommendedFoodDetails({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 70,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(
                      icon: Icons.clear,
                    ),
                  ),
                  //AppIcon(icon: Icons.shopping_cart_outlined),

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
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius30),
                        topLeft: Radius.circular(Dimensions.radius30),
                      ),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.only(top: 5, bottom: 10),
                    child: Center(
                      child:
                          BigText(text: product.name!, size: Dimensions.font26),
                    ),
                  )),
              pinned: true,
              backgroundColor: AppColors.yellowColor,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  ApiDocs.BASE_URL + ApiDocs.UPLOAD_URL + product.img!,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    child: ExpandableText(text: product.description!),
                    margin: EdgeInsets.only(
                        left: Dimensions.width20, right: Dimensions.width20),
                  ),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar:
            GetBuilder<PopularProductController>(builder: (controller) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: Dimensions.width20 * 2.5,
                  right: Dimensions.width20 * 2.5,
                  top: Dimensions.height10,
                  bottom: Dimensions.height10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(false);
                      },
                      child: AppIcon(
                        icon: Icons.remove,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                      ),
                    ),
                    BigText(text: "Quantity = ${controller.inCartItems}"),
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(true);
                      },
                      child: AppIcon(
                        icon: Icons.add,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: Dimensions.bottomHeightBar,
                padding: EdgeInsets.symmetric(
                    vertical: Dimensions.width20,
                    horizontal: Dimensions.height20),
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
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                        ),
                        child:
                            Icon(Icons.favorite, color: AppColors.mainColor)),
                    GestureDetector(
                      onTap: () {
                        controller.addItem(product);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            top: Dimensions.height20,
                            bottom: Dimensions.height20,
                            left: Dimensions.width20,
                            right: Dimensions.width20),
                        decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20)),
                        child: BigText(
                            text: "\$ ${product.price!} | Add to cart",
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }));
  }
}
