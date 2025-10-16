import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/core/widgets/app_button.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/product_card.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/request_state.dart';
import '../../view_model/home_cubit.dart';
import '../../view_model/home_states.dart';

class CategoriesTabBar extends StatelessWidget {
  const CategoriesTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final isCatLoading = state.categoriesState == RequestState.loading;
        final isProductLoading = state.productsState == RequestState.loading;

        final categories = state.categories ?? [];
        final showSkeleton = isCatLoading || isProductLoading;
       final tabsLength = showSkeleton ? 3 : categories.length;

        if (state.categoriesState==RequestState.error || state.productsState==RequestState.error) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline,color: AppColors.redEC, size: 48),
                const SizedBox(height: 10),
                const Text(
                "Something went wrong",
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
                const SizedBox(height: 10),
                AppButton(
                  onPress: () {
                      final cubit = context.read<HomeCubit>();
                      cubit.fetchCategories();
                      cubit.fetchProducts();
                  },
                  text: "Retry",
                ),
              ],
            ),
          );
        }else {
          return DefaultTabController(
          length: tabsLength,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              TabBar(
                isScrollable: true,
                indicatorColor: AppColors.blue,
                labelColor: AppColors.blue,
                unselectedLabelColor: Colors.grey,
                labelStyle: AppTextStyles.manropeSemiBold16,
                unselectedLabelStyle: AppTextStyles.manropeSemiBold14,
                tabs: showSkeleton
                    ? List.generate(
                  3,
                      (index) => const Tab(
                    child: SizedBox(
                      width: 60,
                      height: 20,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                    ),
                  ),
                )
                    : categories.map((category) => Tab(text: category)).toList(),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 400,
                child: TabBarView(
                  children: List.generate(tabsLength, (tabIndex) {
                    if (showSkeleton) {
                      return GridView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(height: 120, color: Colors.grey[400]),
                                const SizedBox(height: 8),
                                Container(height: 15, width: double.infinity, color: Colors.grey[400]),
                                const SizedBox(height: 4),
                                Container(height: 15, width: 80, color: Colors.grey[400]),
                              ],
                            ),
                          );
                        },
                      );
                    }


                    final categoryProducts = state.products
                        ?.where((p) => p.category == categories[tabIndex])
                        .toList();

                    if (categoryProducts == null || categoryProducts.isEmpty) {
                      return const Center(child: Text("No products"));
                    }

                    return GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: categoryProducts.length,
                      itemBuilder: (context, index) {
                        return ProductCard(product: categoryProducts[index]);
                      },
                    );
                  }),
                ),
              ),
            ],
          ),
        );
        }
      },
    );
  }
}
