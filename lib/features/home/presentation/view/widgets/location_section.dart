import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/core/utils/app_text_style.dart';
import 'package:flutter_task/core/utils/request_state.dart';

import '../../view_model/home_cubit.dart';
import '../../view_model/home_states.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          previous.locationState != current.locationState ||
          previous.locationName != current.locationName,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Container(
            height: 55,
            width: double.infinity,
            padding: const EdgeInsets.symmetric( horizontal: 3),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.dark14, width: 1.5),
              color: AppColors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.dark0A,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: AppColors.dark14, width: 1.5),
                  ),
                  child: const Icon(
                    Icons.location_on_outlined,
                    color: AppColors.navy,
                    size: 40,
                  ),
                ),
                const SizedBox(width: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Send To",
                        style: AppTextStyles.manropeSemiBold12.copyWith(
                          color: AppColors.dark52,
                        ),
                      ),
                      Expanded(
                        child: Builder(
                          builder: (_) {
                            if (state.locationState == RequestState.loading) {
                              return const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: AppColors.navy,
                                ),
                              );
                            } else if (state.locationState ==
                                RequestState.loaded) {
                              return Text(
                                state.locationName ?? "Unknown Location",
                                style: AppTextStyles.manropeSemiBold14.copyWith(
                                  color: AppColors.dark,
                                ),
                                overflow: TextOverflow.ellipsis,
                              );
                            } else {
                              return Text(
                                "Sorry, we can't detect your location",
                                style: AppTextStyles.manropeSemiBold14.copyWith(
                                  color: AppColors.redEC,
                                ),
                                overflow: TextOverflow.ellipsis,
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),

                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(

                    backgroundColor: WidgetStateProperty.all(AppColors.blue),
                  ),
                  child: Text(
                    "change",
                    style: AppTextStyles.manropeSemiBold16.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
