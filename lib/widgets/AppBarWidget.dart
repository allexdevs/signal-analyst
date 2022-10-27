import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget(
      {super.key, required this.title, this.link1, this.link2, this.link3});

  final String title;
  final dynamic link1;
  final dynamic link2;
  final dynamic link3;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title:
            Text(title, style: const TextStyle(fontFamily: 'Poppins Regular')),
        backgroundColor: const Color(0xFF3B5A68),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, link1);
              },
              icon: const Icon(
                Icons.bar_chart_rounded,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, link2);
              },
              icon: const Icon(
                Icons.list,
                color: Colors.white,
              )),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, link3);
                },
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                )),
          )
        ]);
  }
}
