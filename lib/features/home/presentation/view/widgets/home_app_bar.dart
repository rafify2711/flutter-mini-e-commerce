import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/core/utils/assets_name.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      leadingWidth: 120,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: SizedBox(
          width: 120,
          height: 40,
          child: SvgPicture.asset(
            AssetsName.appIcon,
          ),
      ),),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right:10),
          child: AppBarIconBuilder(AssetsName.searchIcon, false),
        ),

        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: AppBarIconBuilder(AssetsName.shoppingBagIcon, true),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

Widget AppBarIconBuilder(String asset, bool isNotification) {
   return Container(
    padding: const EdgeInsets.all(2),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: AppColors.dark14,
        width: 1.5,
      ),
    ),
    child: CircleAvatar(
      backgroundColor: AppColors.white,
      radius: 20,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              asset,
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(
                AppColors.navy,
                BlendMode.srcIn,
              ),
            ),
          ),
          if (isNotification)
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.redEC,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    ),
  );
}
