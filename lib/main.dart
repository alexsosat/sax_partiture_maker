import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sax_music_editor/routes/app_pages.dart';
import 'dart:io' show Platform;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    await DesktopWindow.setMinWindowSize(const Size(600, 600));
    await DesktopWindow.setMaxWindowSize(const Size(1920, 1080));
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Partituras Sax',
      debugShowCheckedModeBanner: false,

      // Theme settings
      themeMode: ThemeMode.dark,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),

      /// Route management
      initialRoute: AppPages.inital,
      getPages: AppPages.routes,
      unknownRoute: AppPages.routes[0],
    );
  }
}
