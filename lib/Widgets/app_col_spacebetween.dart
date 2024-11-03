import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'Big_text.dart';
import 'Icon_and_text_Widgets.dart';
import 'small_text.dart';
class AppColumnSpacebetween extends StatelessWidget {
  final String text;

  const AppColumnSpacebetween({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text,size: Dimension.font26,),
        SizedBox(height: Dimension.height10),
        //comment secction//
        Row(
          children: [
            Wrap(
              children: List.generate(5, (index) => const Icon(Icons.star,color: AppColor.mainColor,),),
            ),
            SizedBox(width: Dimension.width15,),
            const SmallText(text: "4.8"),
            SizedBox(width: Dimension.width20,),
            const SmallText(text: "156"),
            SizedBox(width: Dimension.width4,),
            const SmallText(text: "comments"),
          ],
        ),
        SizedBox(height:Dimension.height20),
        //time & distance
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const IconAndTextWidget(icon: Icons.circle_sharp,
                iconColor: AppColor.iconColor1, text: "Normal"
            ),
            SizedBox(width: Dimension.width10),
            const IconAndTextWidget(icon: Icons.location_on,
                iconColor: AppColor.mainColor, text: "1.5km"
            ),
            SizedBox(width: Dimension.width15),
            const IconAndTextWidget(icon: Icons.access_time_filled_rounded,
                iconColor: AppColor.iconColor2, text: "28min"
            ),
          ],
        )
        //const SizedBox(height: 10),
        // Add more widgets here if necessary
      ],
    );
  }
}
