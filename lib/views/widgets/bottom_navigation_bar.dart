import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final Color bgColor;
  final Color iconColor;

  const CustomNavigationBar({
    super.key,
    this.bgColor = const Color(0xFFFFEDCD),
    this.iconColor = const Color(0xFF490715),
  });

  void _navigate(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: bgColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () => _navigate(context, "/home"),
              icon: const Icon(Icons.home),
              color: iconColor,
              iconSize: 30,
              tooltip: 'Home',
            ),
            IconButton(
              onPressed: () => _navigate(context, "/activities-list"),
              icon: const Icon(Icons.list),
              color: iconColor,
              iconSize: 30,
              tooltip: 'Activity list',
            ),
            IconButton(
              onPressed: () => _navigate(context, "/add-new-activity"),
              icon: const Icon(Icons.add_circle),
              color: iconColor,
              iconSize: 30,
              tooltip: 'Add activity',
            ),
            IconButton(
              onPressed: () => _navigate(context, "/shop"),
              icon: const Icon(Icons.shopping_basket),
              color: iconColor,
              iconSize: 30,
              tooltip: 'Shop',
            ),
            IconButton(
              onPressed: () => _navigate(context, "/profile"),
              icon: const Icon(Icons.account_circle),
              color: iconColor,
              iconSize: 30,
              tooltip: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
