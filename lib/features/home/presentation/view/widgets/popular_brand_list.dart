import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/core/utils/assets_name.dart';
import '../../../../../core/utils/app_text_style.dart';

class PopularBrandList extends StatelessWidget {
  const PopularBrandList({super.key});

  final List<Map<String, String>> brands = const [
    {"image": AssetsName.hm, "name": "H&M"},
    {"image": AssetsName.lacoste, "name": "Lacoste"},
    {"image": AssetsName.zara, "name": "Zara"},
    {"image": AssetsName.hm, "name": "H&M"},
    {"image": AssetsName.lacoste, "name": "Lacoste"},
    {"image": AssetsName.zara, "name": "Zara"},

  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular Brands',
            style: AppTextStyles.manropeSemiBold20.copyWith(color: AppColors.dark),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: brands.length,
              itemBuilder: (context, index) {
                final brand = brands[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: AssetImage(brand['image']!),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        brand['name']!,
                        style: AppTextStyles.manropeSemiBold14.copyWith(color: AppColors.dark),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
