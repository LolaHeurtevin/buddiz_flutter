import 'package:flutter/material.dart';
import 'views/home.dart';
import 'views/activities_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buddiz',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
      routes: {
        HomePage.route: (_) => const HomePage(),
        ActivitiesListPage.route: (_) => const ActivitiesListPage(),
      },
    );
  }
}
