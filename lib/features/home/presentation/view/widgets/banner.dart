import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';

class BannerWidget extends StatelessWidget {
  String image;
  String title;
  String subtitle;

   BannerWidget({
    super.key,
    required this.image,
     required this.title,
     required this.subtitle
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150,
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                AppColors.white,
                AppColors.blue,
              ],
            ),
            borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.manropeSemiBold18.copyWith(color: AppColors.white)
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 150,
                      child: Text(
                        subtitle,
                        style: AppTextStyles.manropeSemiBold16.copyWith(color: AppColors.white )
                        )
                    ),
                    Spacer(),

                    ElevatedButton(onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 0,

                      ),
                      child:  Text(
                        'Shop Now',
                        style: AppTextStyles.manropeSemiBold14.copyWith(color: AppColors.blueD1),
                        ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
        Positioned(
          right: 5,
          top: -20,
          bottom: -5,
          child:    Image.asset(image,height: 250,width: 220,),)
       
      ],
    );
  }
}