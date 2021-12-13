import 'package:get/get.dart';

import 'package:sax_music_editor/modules/editor/models/sax_note.dart';
import 'package:sax_music_editor/modules/editor/pages/widgets/snackbar.dart';
import 'package:sax_music_editor/modules/projects/models/song.dart';
import 'package:sax_music_editor/services/song_storage.dart';

class EditorController extends GetxController {
  String title = "Nueva Canción";
  List<SaxNote> partiture = List<SaxNote>.empty(growable: true).obs;

  final Storage storageManager = Storage();
  Rx<Song> song;

  EditorController({required this.song});

  @override
  void onInit() {
    print(song.value.title);
    super.onInit();
  }

  void onReorder(int oldIndex, int newIndex) {
    // song.update((val) {
    //   SaxNote row = val!.partiture.removeAt(oldIndex);
    //   val.partiture.insert(newIndex, row);
    // });
    SaxNote row = partiture.removeAt(oldIndex);
    partiture.insert(newIndex, row);
  }

  void saveSong() async {
    if (title.isEmpty) {
      snackbarMessage(
        title: "El título de la canción no puede estar vacío",
        message: "Favor de colocar un título a la canción",
      );
      return;
    }

    if (await storageManager
        .writeSong(Song(title: title, partiture: partiture))) {
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
