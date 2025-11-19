import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final Color bgColor;
  final Color iconColor;

  const CustomNavigationBar({
    super.key,
    this.bgColor = const Color(0xFFFFEDCD),
    this.iconColor = const Color(0xFF490715)
  });

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
            Icon(Icons.home, color: iconColor, size: 30, semanticLabel: 'Home'),
            Icon(Icons.list, color: iconColor, size: 30, semanticLabel: 'Activity list'),
            Icon(Icons.add_circle, color: iconColor, size: 30, semanticLabel: 'Add activity'),
            Icon(Icons.shopping_basket, color: iconColor, size: 30, semanticLabel: 'Shop'),
            Icon(Icons.account_circle, color: iconColor, size: 30, semanticLabel: 'Profile'),
          ],
        ),
      ),
    );
  }
}
