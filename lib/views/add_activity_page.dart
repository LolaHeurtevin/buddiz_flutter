import 'package:flutter/material.dart';
import 'widgets/main_layout.dart';
import 'widgets/add_activity_form.dart';

class AddActivityPage extends StatefulWidget {
  static const route = '/add-new-activity';
  const AddActivityPage({super.key});

  @override
  State<AddActivityPage> createState() => _AddActivityPage();
}

class _AddActivityPage extends State<AddActivityPage> {

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: AddActivityFormWidget()
    );
  }
}