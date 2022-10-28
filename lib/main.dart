import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:signal_analyst/pages/Analysis_Page.dart';
import 'package:signal_analyst/pages/ListPage.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
      size: Size(840, 700),
      minimumSize: Size(840, 700),
      maximumSize: Size(840, 700),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      title: "Signal Analyst");

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => AnalisysPage(),
        '/signal-list': (context) => const ListPage()
      },
    );
  }
}
