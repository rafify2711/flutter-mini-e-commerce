import 'package:flutter/material.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/banners_auto_scrollable_list.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/categories_tab_bar.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/home_app_bar.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/location_section.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/popular_brand_list.dart';

import '../../../../core/utils/app_colors.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const HomeAppBar(),
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              LocationSection(),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: BannersAutoScrollableList(),
              ),
              PopularBrandList(),
              CategoriesTabBar(),
            ],
          ),
        ),
      ),

    );
  }
}
