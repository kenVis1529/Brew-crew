import 'package:flutter/material.dart';
import 'package:brewcrew/modules/brew.dart';

class BrewTile extends StatelessWidget {
  const BrewTile({required this.brew, super.key});
  final Brew brew;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.brown[brew.strength],
          ),
          title: Text(brew.name),
          subtitle: Text("Takes ${brew.sugars} sugar(s)"),
        ),
      ),
    );
  }
}
