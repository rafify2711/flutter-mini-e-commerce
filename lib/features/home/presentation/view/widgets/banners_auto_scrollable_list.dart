import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/assets_name.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/banner.dart';

class BannersAutoScrollableList extends StatefulWidget {
  const BannersAutoScrollableList({super.key});

  @override
  State<BannersAutoScrollableList> createState() =>
      _BannersAutoScrollableListState();
}

class _BannersAutoScrollableListState extends State<BannersAutoScrollableList> {
  final ScrollController _scrollController = ScrollController();
  Timer? _timer;
  double _scrollPosition = 0.0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoScroll();
    });
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (!_scrollController.hasClients) return;

      final isRTL = Directionality.of(context) == TextDirection.RTL;
      final maxScroll = _scrollController.position.maxScrollExtent;
      final screenWidth = MediaQuery.of(context).size.width * 0.92;

      if (isRTL) {
        if (_scrollPosition <= 0) {
          _scrollPosition = maxScroll;
        } else {
          _scrollPosition -= screenWidth;
        }
      } else {
        if (_scrollPosition >= maxScroll) {
          _scrollPosition = 0;
        } else {
          _scrollPosition += screenWidth;
        }
      }

      _scrollController.animateTo(
        _scrollPosition,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isRTL = Directionality.of(context) == TextDirection.RTL;

    return SizedBox(
      height: 165,
      child: ListView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        reverse: isRTL,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .92,
            child: BannerWidget(
              image: AssetsName.bannerModel,
              title: "banner_1_title".tr(),
              subtitle: "banner_1_subtitle".tr(),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .92,
            child: BannerWidget(
              image: AssetsName.bannerModel,
              title: "banner_2_title".tr(),
              subtitle: "banner_2_subtitle".tr(),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .92,
            child: BannerWidget(
              image: AssetsName.bannerModel,
              title: "banner_3_title".tr(),
              subtitle: "banner_3_subtitle".tr(),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .92,
            child: BannerWidget(
              image: AssetsName.bannerModel,
              title: "banner_4_title".tr(),
              subtitle: "banner_4_subtitle".tr(),
            ),
          ),
        ],
      ),
    );
  }
}
