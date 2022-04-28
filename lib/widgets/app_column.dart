import 'package:flutter/material.dart';
import 'package:food_order/utils/colors.dart';
import 'package:food_order/utils/dimesions.dart';
import 'package:food_order/widgets/Icon_and_text_widget.dart';
import 'package:food_order/widgets/big_text.dart';
import 'package:food_order/widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text, size: Dimensions.font26),
        SizedBox(height: Dimensions.height10),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) => Icon(Icons.star,
                    color: AppColors.mainColor, size: Dimensions.starIcon),
              ),
            ),
            SizedBox(width: Dimensions.width10),
            SmallText(text: '4.8'),
            SizedBox(width: Dimensions.width10),
            SmallText(text: '1287 comments')
          ],
        ),
        SizedBox(height: Dimensions.height20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
                icon: Icons.circle_sharp,
                text: 'Normal',
                iconColor: AppColors.iconColor1),
            IconAndTextWidget(
                icon: Icons.location_on,
                text: '1.7km',
                iconColor: AppColors.mainColor),
            IconAndTextWidget(
                icon: Icons.access_time_rounded,
                text: '24min',
                iconColor: AppColors.iconColor2),
          ],
        )
      ],
    );
  }
}
