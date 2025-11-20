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
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Ajouter une activité",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Toi aussi fais vivre la communauté en proposant une rencontre !",
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: AddActivityFormWidget()
            ),
          ],
        ),
    );
  }
}