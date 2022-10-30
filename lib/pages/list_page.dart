// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:signal_analyst/widgets/app_bar_widget.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          title: "Signal List",
          link1: '/',
          link2: '/signal-list',
        ),
      ),
      body: Center(child: Text("Lista de Signais")),
    );
  }
}
