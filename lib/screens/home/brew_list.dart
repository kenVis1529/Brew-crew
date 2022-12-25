import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    final brews = Provider.of<QuerySnapshot?>(context);

    if (brews != null) {
      for (var doc in brews.docs) {
        log(doc.data().toString());
      }
    }
    return Container();
  }
}
