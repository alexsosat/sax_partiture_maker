import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sax_music_editor/routes/app_pages.dart';

void main() async {
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
