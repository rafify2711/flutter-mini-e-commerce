import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/assets_name.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/banner.dart';

class BannersAutoScrollableList extends StatefulWidget {
  const BannersAutoScrollableList({super.key});

  @override
  State<BannersAutoScrollableList> createState() => _BannersAutoScrollableListState();
}

class _BannersAutoScrollableListState extends State<BannersAutoScrollableList> {
  final ScrollController _scrollController = ScrollController();
  Timer? _timer;
  double _scrollPosition = 0.0;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      final maxScroll = _scrollController.position.maxScrollExtent;
      if (_scrollPosition >= maxScroll) {
        _scrollPosition = 0;
      } else {
        _scrollPosition += MediaQuery.of(context).size.width * 0.92;
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
    return SizedBox(
      height: 165,
      child: ListView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .92,
            child: BannerWidget(
              image: AssetsName.bannerModel,
              title: "50% Off Today",
              subtitle: "Limited Time Picks just for you",
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .92,
            child: BannerWidget(
              image: AssetsName.bannerModel,
              title: "Flash Sale",
              subtitle: "Shop Now Before It Ends",
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .92,
            child:  BannerWidget(
              image: AssetsName.bannerModel,
              title: "New Arrivals",
              subtitle: "Check out our latest collection",
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .92,
            child:  BannerWidget(
              image: AssetsName.bannerModel,
              title: "20% Sale",
              subtitle: "Check out our latest collection",
            ),
          ),
        ],
      ),
    );
  }
}
