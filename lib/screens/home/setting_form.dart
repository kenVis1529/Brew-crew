import 'dart:developer';
import 'package:brewcrew/modules/user.dart';
import 'package:brewcrew/services/database.dart';
import 'package:brewcrew/shared/constants.dart';
import 'package:brewcrew/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingForm extends StatefulWidget {
  const SettingForm({super.key});

  @override
  State<SettingForm> createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> sugars = ["0", "1", "2", "3", "4", "5"];
  String? _currentName;
  String? _currentSugars;
  int? _currentStrength;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(
        context); // Cẩn thận là phải MyUser nha, chứ không phải User

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user?.uid).userData,
        builder: (context, snapshot) {
          /// Nếu người dùng không có dữ liệu thì hiện lên Loading page
          /// có thì hiện lên Setting Form
          if (snapshot.hasData) {
            UserData? userData = snapshot.data;
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text('Change your setting'),
                  const SizedBox(height: 20.0),

                  /// Tên khách hàng
                  TextFormField(
                    initialValue: userData?.name,
                    decoration: textInputDecoration.copyWith(
                      hintText: "Name",
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? "Enter your name" : null,
                    onChanged: (value) => setState(() => _currentName = value),
                  ),
                  const SizedBox(height: 20.0),

                  // Dropdown
                  /// Chọn mức độ đường cho cafe
                  DropdownButtonFormField(
                      value: _currentSugars ?? userData?.sugars,
                      items: sugars.map((sugar) {
                        return DropdownMenuItem(
                          value: sugar,
                          child: Text('$sugar sugar(s)'),
                        );
                      }).toList(),
                      onChanged: (value) =>
                          setState(() => _currentSugars = value!)),
                  const SizedBox(height: 20.0),

                  // Slider
                  /// Dùng để chọn mức độ của cafe
                  Slider(
                    value: (_currentStrength ?? userData?.strength)!.toDouble(),
                    min: 100,
                    max: 900,
                    divisions: 8,
                    activeColor:
                        Colors.brown[(_currentStrength ?? userData?.strength)!],
                    inactiveColor:
                        Colors.brown[(_currentStrength ?? userData?.strength)!],
                    onChanged: (value) =>
                        setState(() => _currentStrength = value.round()),
                  ),
                  // Confirm button
                  ElevatedButton(
                      onPressed: () async {
                        /// Nếu thông tin điền vào hợp lệ, cập nhật thông tin người dùng trên FireStore
                        if (_formKey.currentState!.validate()) {
                          await DatabaseService(uid: user?.uid).updateUserData(
                            (_currentSugars ?? userData!.sugars)
                                .toString(), // Sugars
                            (_currentName ?? userData?.name).toString(), // Name
                            _currentStrength ?? userData!.strength!, // Strength
                          );
                          log("1");
                        }

                        /// Sẽ không thoát khỏi Setting Form nếu State không được liên kết với BuildContext
                        /// * (Tìm hiểu thêm về mounted)
                        if (!mounted) {
                          return;
                        }
                        Navigator.pop(context);
                      },
                      child: const Text('Confirm'))
                ],
              ),
            );
          } else {
            return const Loading();
          }
        });
  }
}
