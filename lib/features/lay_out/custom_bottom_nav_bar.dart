import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_text_style.dart';
import '../../core/utils/assets_name.dart';


class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  CustomBottomNavBar({super.key, required this.currentIndex, required this.onTap});

  final List<Map<String, dynamic>> items = [
    {"icon": AssetsName.home, "label": "home".tr()},
    {"icon": AssetsName.heart, "label": "favorite".tr()},
    {"icon": AssetsName.shoppingBagIcon, "label": "cart".tr()},
    {"icon": AssetsName.person, "label": "profile".tr()},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final item = items[index];
          final selected = index == currentIndex;
          return GestureDetector(
            onTap: () => onTap(index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: selected ?AppColors.blue : Colors.transparent,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    item["icon"],
                    color: selected ? AppColors.white : AppColors.dark52,
                    width: 20,
                    height: 20,
                  ),
                  if (selected) ...[
                    const SizedBox(width: 8),
                    Text(
                      item["label"],
                      style: AppTextStyles.manropeMedium16.copyWith(color: Colors.white),
                    ),
                  ]
                ],
              ),

            ),
          );
        }),
      ),
    );
  }
}
