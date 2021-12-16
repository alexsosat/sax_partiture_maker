import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sax_music_editor/routes/app_pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(40),
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: 210,
            ),
            Text(
              "Creador de música para Saxofón",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(color: Colors.white),
            ),
            const SizedBox(height: 30),
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
            // const SizedBox(height: 20),
            // ElevatedButton(
            //   child: const Text("Play Sound"),
            //   style: ElevatedButton.styleFrom(
            //     minimumSize: const Size(150, 60),
            //   ),
            //   onPressed: () => assetsAudioPlayer.play(),
            // ),
          ],
        ),
      ),
    );
  }
}
