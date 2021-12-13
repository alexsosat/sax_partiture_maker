import 'package:get/get.dart';
import 'package:sax_music_editor/modules/projects/models/song.dart';
import 'package:sax_music_editor/services/song_storage.dart';

class SongSelectionController extends GetxController
    with StateMixin<List<Song>> {
  final Storage storage = Storage();

  @override
  void onInit() {
    getSongs();
    super.onInit();
  }

  void getSongs() {
    try {
      final List<Song>? storedSongs = storage.storedSongs;
      if (storedSongs == null || storedSongs.isEmpty) {
        change(storedSongs, status: RxStatus.empty());
      } else {
        change(storedSongs, status: RxStatus.success());
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
