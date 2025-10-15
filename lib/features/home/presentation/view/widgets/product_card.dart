import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task/core/utils/app_text_style.dart';
import 'package:flutter_task/core/utils/assets_name.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../data/models/product.dart';

class ProductCard extends StatelessWidget {
  Product product;
   ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
             height: 120,
             decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(12),

              ),
              child: Image.network(product.image??""),
            ),
            Row(
              children: [
                Expanded(child: Text(product.title??"",style: AppTextStyles.manropeSemiBold12,maxLines: 3,)),
                SvgPicture.asset(AssetsName.ratingIcon),
                Text(product.rating?.rate.toString()??"",style: AppTextStyles.manropeMedium14,)

              ],
            ),
           Row(
             children: [
               Text("\$ ${product.price}",style:AppTextStyles.manropeSemiBold16 ,maxLines: 3,),
               SizedBox(width:12 ,),
               Text("\$49.99",style: AppTextStyles.manropeSemiBold12.copyWith(color: AppColors.dark52),),
             ],
           ),

          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: AppColors.dark14,width: 1.5)

            ),
              child: IconButton(onPressed: (){}, icon: Icon(Icons.add),color: AppColors.navy,))
        )
      ],
    );

  }
}
