import 'package:flutter/material.dart';
import 'bottom_navigation_bar.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  final bool showAppBar;

  const MainLayout({
    super.key,
    required this.child,
    this.showAppBar = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar
          ? AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
        ),
      )
          : null,
      body: SafeArea(
        child: child,
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
