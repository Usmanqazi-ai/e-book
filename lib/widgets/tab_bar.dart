import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/device/device_utils.dart';

class UTabBar extends StatelessWidget implements PreferredSizeWidget {
  const UTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        tabs: tabs,
        dividerColor: Colors.transparent,
        isScrollable: true,
        indicatorColor: UColors.primary,
        labelColor: UColors.primary,
        labelStyle: Theme.of(context).textTheme.bodyLarge,
        unselectedLabelColor: UColors.lightGry,
        indicatorSize: TabBarIndicatorSize.label,
        tabAlignment: TabAlignment.start,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(UDeviceUtils.getAppBarHeight());
}
