import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sax_music_editor/routes/app_pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const FlutterLogo(
              size: 90,
            ),
            const SizedBox(height: 90),
            ElevatedButton(
              child: const Text("Nueva canción"),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 60),
              ),
              onPressed: () => Get.toNamed(Routes.editor),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text("Cargar canción"),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 60),
              ),
              onPressed: () => Get.toNamed(Routes.projects),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text("Ajustes"),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 60),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
