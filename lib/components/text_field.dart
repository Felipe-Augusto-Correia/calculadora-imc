import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  final String labelFieldText;
  final String warningText;
  final TextEditingController controller;

  TextForm({this.labelFieldText, this.warningText, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: labelFieldText,
          labelStyle: TextStyle(
            color: Colors.white,
          )),
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 25,
        color: Colors.white,
      ),
      controller: controller,
      validator: (value) {
        if (value.isEmpty) {
          return warningText;
        }
        return null;
      },
    );
  }
}