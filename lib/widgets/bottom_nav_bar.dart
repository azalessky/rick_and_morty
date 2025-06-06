import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class NavBarItem {
  final IconData outlinedIcon;
  final IconData filledIcon;
  final String label;

  NavBarItem(this.outlinedIcon, this.filledIcon, this.label);
}

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;

  const BottomNavBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      NavBarItem(Icons.home_outlined, Icons.home, 'HomeScreen.Characters'.tr()),
      NavBarItem(Icons.favorite_border, Icons.favorite, 'HomeScreen.Favorites'.tr()),
      NavBarItem(Icons.settings_outlined, Icons.settings, 'HomeScreen.Settings'.tr()),
    ];

    return BottomNavigationBar(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      currentIndex: currentIndex,
      onTap: onTap,
      items: items.asMap().entries.map(
        (entry) {
          final index = entry.key;
          final item = entry.value;
          final icon = Icon(currentIndex == index ? item.filledIcon : item.outlinedIcon);

          return BottomNavigationBarItem(
            icon: icon,
            label: item.label,
          );
        },
      ).toList(),
    );
  }
}
