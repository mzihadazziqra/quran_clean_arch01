import 'package:flutter/material.dart';

import '../../core/theme/app_color.dart';

class HomeTabBar extends StatelessWidget {
  const HomeTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.primary1,
          ),
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: AppColor.backgroundColor,
            unselectedLabelColor: AppColor.backgroundColor,
            dividerColor: Colors.transparent,
            indicator: BoxDecoration(
              color: AppColor.primary2,
              borderRadius: BorderRadius.circular(6),
            ),
            tabs: const [
              Tab(
                child: Text(
                  'Surah',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Penanda',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
