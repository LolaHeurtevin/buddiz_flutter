import 'package:flutter/material.dart';
import 'widgets/main_layout.dart';

class ShopPage extends StatelessWidget {
  static const route = '/shop';

  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Boutique",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Bientôt...",
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
          ]
      ),
    );
  }
}