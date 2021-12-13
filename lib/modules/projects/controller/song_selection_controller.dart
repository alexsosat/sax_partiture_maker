import 'package:get/get.dart';
import 'package:sax_music_editor/modules/editor/pages/widgets/overlays.dart';
import 'package:sax_music_editor/modules/projects/models/song.dart';
import 'package:sax_music_editor/services/song_storage.dart';

class SongSelectionController extends GetxController
    with StateMixin<List<Song>> {
  final Storage storage = Storage();

  var storedSongs = List<Song>.empty(growable: true);

  @override
  void onInit() {
    getSongs();
    super.onInit();
  }

  void getSongs() {
    try {
      storedSongs = storage.storedSongs;
      if (storedSongs.isEmpty) {
        change(storedSongs, status: RxStatus.empty());
      } else {
        change(storedSongs, status: RxStatus.success());
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void deleteSong(String songTitle) async {
    int index = storedSongs.indexWhere((element) => element.title == songTitle);
    if (await storage.deleteSong(index)) {
      Get.back();
      snackbarMessage(
        title: "Canción eliminada con éxito",
      );
    } else {
      Get.back();
      snackbarMessage(
        title: "La canción no se pudo eliminar",
      );
    }

    getSongs();
  }
}
