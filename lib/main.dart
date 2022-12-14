import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signal_analyst/pages/analysis_page.dart';
import 'package:signal_analyst/pages/list_page.dart';
import 'package:signal_analyst/repositories/analysis_repository.dart';
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

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AnalysisRepository()),
  ], child: const MyApp()));
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
