import 'dart:developer';
import 'package:brewcrew/modules/brew.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        log("${e.name} ${e.sugar} ${e.strength}");
      }
    }
    return Container();
  }
}
