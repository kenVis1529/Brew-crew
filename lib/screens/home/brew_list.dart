import 'dart:developer';
import 'package:brewcrew/modules/brew.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brewcrew/screens/home/brew_tile.dart';

class BrewList extends StatefulWidget {
  const BrewList({super.key});

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    ///Lấy kết quả của brewCollection trên Stream về log ra màn hình
    final brews = Provider.of<List<Brew>?>(context);

    if (brews != null) {
      for (var e in brews) {
        log("${e.name} ${e.sugars} ${e.strength}");
      }
    }

    /// Liệt kê danh sách thông tin người dùng
    return ListView.builder(
        itemCount: brews?.length,
        itemBuilder: (context, index) => BrewTile(brew: brews![index]));
  }
}
