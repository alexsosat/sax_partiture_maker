import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sax_music_editor/modules/editor/pages/widgets/overlays.dart';
import 'package:sax_music_editor/modules/projects/controller/song_selection_controller.dart';
import 'package:sax_music_editor/modules/projects/pages/selection_appbar.dart';
import 'package:sax_music_editor/routes/app_pages.dart';

class SongSelectionPage extends GetView<SongSelectionController> {
  const SongSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SelectionAppBar(),
      body: controller.obx(
        (songs) => ListView(
          padding: const EdgeInsets.all(20),
          children: songs!
              .map((song) => ListTile(
                    title: Text(song.title),
                    subtitle: Text("${song.partiture.length} nota(s)"),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => Get.toNamed(Routes.editor, arguments: song),
                    onLongPress: () => openDialogWindow(
                      title: "¿Seguro que deseas eliminar este proyecto?",
                      message: "Esta acción no se podrá deshacer",
                      onCancel: () => Get.back(),
                      onConfirm: () => controller.deleteSong(song.title),
                    ),
                  ))
              .toList(),
        ),
        onEmpty: const Center(
          child: Text("No hay canciones guardadas"),
        ),
      ),
    );
  }
}
