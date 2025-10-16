import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_colors.dart';

Widget iconBuilder(String asset, bool isNotification, { VoidCallback? onPressed}) {
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
      backgroundColor: Colors.transparent,
      radius: 20,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          IconButton(
            onPressed: onPressed,
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
