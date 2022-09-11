import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputDialog extends StatefulWidget {
  const InputDialog({Key? key}) : super(key: key);

  @override
  State<InputDialog> createState() => _InputDialogState();
}

class _InputDialogState extends State<InputDialog> {
  final _inputController = TextEditingController();
  var _cityName = "";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("add_city".tr),
      content: TextField(
          decoration: InputDecoration(
              hintText: "example_city".tr
          ),
          controller: _inputController,
          onChanged: (String input) {
            _cityName = input;
          }),
      actions: [
        TextButton(
            onPressed: () async {
              if (_inputController.text.isNotEmpty) {
                Navigator.pop(context, _cityName);
              }
            },
            child: Text("search".tr))
      ],
    );
  }
}
