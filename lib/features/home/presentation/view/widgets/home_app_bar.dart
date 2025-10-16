import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/core/utils/assets_name.dart';

import '../../../../../core/config/routes_name.dart';
import '../../../../../core/widgets/icon_builder.dart';

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
          child: SvgPicture.asset(AssetsName.appIcon),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: iconBuilder(AssetsName.searchIcon, false),
        ),

        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: iconBuilder(
            AssetsName.shoppingBagIcon,
            true,
            onPressed: () {
              Navigator.pushNamed(context, RoutesName.cart);
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
