import 'package:flutter/material.dart';

class AddActivityFormWidget extends StatefulWidget {
  const AddActivityFormWidget({super.key});

  @override
  AddActivityFormWidgetState createState() {
    return AddActivityFormWidgetState();
  }
}

class AddActivityFormWidgetState extends State<AddActivityFormWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Titre',
              labelStyle: TextStyle(
                  color: Colors.black87,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF490715)),
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey,
                      width: 1.0)
              ),
            ),
          ),
          const SizedBox(height: 20),

          TextFormField(
            maxLines: 4,
            decoration: InputDecoration(labelText: 'Description',
              labelStyle: TextStyle(
                  color: Colors.black87,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF490715)),
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey,
                      width: 1.0)
              ),
            ),
          ),
          const SizedBox(height: 20),

          TextFormField(
            decoration: InputDecoration(labelText: 'Adresse',
              labelStyle: TextStyle(
                  color: Colors.black87,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF490715)),
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey,
                      width: 1.0)
              ),
            ),
          ),
          const SizedBox(height: 20),

          ElevatedButton(
            style: TextButton.styleFrom(foregroundColor: Color(0xFF490715)),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Enregistrement...')),
                );
              }
            },
            child: const Text('Enregistrer'),
          ),
        ]
      ),
    );
  }
}