import 'package:flutter/material.dart';

import '../config/palette.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomTabBar(
      {super.key,
      required this.icons,
      required this.selectedIndex,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: const BoxDecoration(
        border: Border(
            top: BorderSide(
          color: Palette.facebookBlue,
          width: 3.0,
        )),
      ),
      tabs: icons
          .asMap()
          .map((i, e) => MapEntry(
                i,
                Tab(
                  icon: Icon(e,color: i == selectedIndex?Palette.facebookBlue:Colors.black45,),
                ),
              ))
          .values
          .toList(),
      onTap: onTap,
    );
  }
}
