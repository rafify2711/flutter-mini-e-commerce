import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';

class BannerWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const BannerWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final bool isRtl =
        Directionality.of(context) == ui.TextDirection.rtl;

    return Stack(
      children: [
        Container(
          alignment: isRtl ? Alignment.centerRight : Alignment.centerLeft,
          height: 166,
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: isRtl ? Alignment.topLeft : Alignment.topRight,
              end: isRtl ? Alignment.bottomRight : Alignment.bottomLeft,
              colors: const [
                AppColors.white,
                AppColors.blue,
              ],
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(isRtl ? 0 : 20),
              bottomLeft: Radius.circular(isRtl ? 0 : 20),
              topRight: Radius.circular(isRtl ? 20 : 0),
              bottomRight: Radius.circular(isRtl ? 20 : 0),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment:
                  isRtl ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.manropeSemiBold18
                          .copyWith(color: AppColors.white),
                      textAlign: isRtl ? TextAlign.right : TextAlign.left,
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 150,
                      child: Text(
                        subtitle,
                        style: AppTextStyles.manropeSemiBold14
                            .copyWith(color: AppColors.white),
                        textAlign: isRtl ? TextAlign.right : TextAlign.left,
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'shop_now'.tr(),
                        style: AppTextStyles.manropeSemiBold12
                            .copyWith(color: AppColors.blueD1),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: -3,
          top: -2,
          bottom: 25,
          child: Image.asset(
            image,
            height: 250,
            width: 220,
          ),
        ),
      ],
    );
  }
}
