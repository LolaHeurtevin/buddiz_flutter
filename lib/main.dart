import 'package:flutter/material.dart';
import 'views/home.dart';
import 'views/activities_list.dart';
import 'views/add_activity_page.dart';
import 'views/onboarding.dart';

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
      initialRoute: OnboardingPage.route,
      routes: {
        OnboardingPage.route: (_) => const OnboardingPage(),
        HomePage.route: (_) => const HomePage(),
        ActivitiesListPage.route: (_) => const ActivitiesListPage(),
        AddActivityPage.route: (_) => const AddActivityPage(),
      },
    );
  }
}
