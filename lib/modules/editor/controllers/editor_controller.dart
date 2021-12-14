import 'package:get/get.dart';

import 'package:sax_music_editor/modules/editor/models/sax_note.dart';
import 'package:sax_music_editor/modules/editor/pages/widgets/overlays.dart';
import 'package:sax_music_editor/modules/projects/models/song.dart';
import 'package:sax_music_editor/services/song_storage_service.dart';

class EditorController extends GetxController {
  final SongStorageService storageManager = SongStorageService.instance;
  Rx<Song> song;

  EditorController({required this.song});

  void onReorder(int oldIndex, int newIndex) {
    song.update((val) {
      SaxNote row = val!.partiture.removeAt(oldIndex);
      val.partiture.insert(newIndex, row);
    });
  }

  void saveSong() async {
    final toSaveSong = song.value;
    if (toSaveSong.title.isEmpty) {
      snackbarMessage(
        title: "El título de la canción no puede estar vacío",
        message: "Favor de colocar un título a la canción",
      );
    } else if (storageManager.songExists(toSaveSong)) {
      openDialogWindow(
        title: "El nombre de este proyecto ya esta en uso",
        message: "¿Deseas sobre escribir el proyecto?",
        onCancel: () => Get.back(),
        onConfirm: () async {
          if (await storageManager.overwriteSong(toSaveSong)) {
            Get.back();
            snackbarMessage(
              title: "Canción guradada con éxito",
            );
          } else {
            Get.back();
            snackbarMessage(
              title: "La canción no se pudo guardar",
            );
          }
        },
      );
    } else {
      if (await storageManager.writeSong(toSaveSong)) {
        snackbarMessage(
          title: "Canción guradada con éxito",
        );
      } else {
        snackbarMessage(
          title: "La canción no se pudo guardar",
        );
      }
    }
  }
}
