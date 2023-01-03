import 'dart:developer';

import 'package:brewcrew/shared/constants.dart';
import 'package:flutter/material.dart';

class SettingForm extends StatefulWidget {
  const SettingForm({super.key});

  @override
  State<SettingForm> createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> sugars = ["0", "1", "2", "3", "4", "5"];
  String _currentName = "";
  String _currentSugars = "0";
  int _currentStrength = 100;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Text('Change your setting'),
          const SizedBox(height: 20.0),

          /// Tên khách hàng
          TextFormField(
            decoration: textInputDecoration,
            validator: (value) => value!.isEmpty ? "Enter your name" : null,
            onChanged: (value) => setState(() => _currentName = value),
          ),
          const SizedBox(height: 20.0),

          // Dropdown
          /// Chọn mức độ đường cho cafe
          DropdownButtonFormField(
              value: _currentSugars,
              items: sugars.map((sugar) {
                return DropdownMenuItem(
                  value: sugar,
                  child: Text('$sugar sugar(s)'),
                );
              }).toList(),
              onChanged: (value) => setState(() => _currentSugars = value!)),
          const SizedBox(height: 20.0),

          // Slider
          /// Dùng để chọn mức độ của cafe
          Slider(
            value: _currentStrength.toDouble(),
            min: 100, // Giá trị ngoài cùng bên trái
            max: 900, // Giá trị ngoài cùng bên phải
            divisions: 8, // Số mức mà slider có thể kéo
            activeColor:
                Colors.brown[_currentStrength], // Màu của thanh được chọn
            inactiveColor: Colors.brown[_currentStrength], // Màu của thanh tổng
            onChanged: (value) =>
                setState(() => _currentStrength = value.round()),
          ),
          // Confirm button
          ElevatedButton(
              onPressed: () {
                log(_currentName);
                log(_currentSugars);
                log(_currentStrength.toString());
              },
              child: const Text('Confirm'))
        ],
      ),
    );
  }
}
