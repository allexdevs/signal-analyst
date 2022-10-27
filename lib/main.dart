import 'package:flutter/material.dart';
import 'package:signal_analyst/pages/AnalysisPage.dart';
import 'package:signal_analyst/pages/ListPage.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
      size: Size(800, 620),
      minimumSize: Size(800, 620),
      maximumSize: Size(800, 620),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      title: "Signal Analyst");

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const MyApp());
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
        '/': (context) => const AnalisysPage(),
        '/signal-list': (context) => const ListPage()
      },
    );
  }
}
