import 'package:get/get.dart';
import 'package:sax_music_editor/modules/editor/controllers/editor_controller.dart';
import 'package:sax_music_editor/modules/projects/models/song.dart';

class EditorBinding implements Bindings {
  @override
  void dependencies() {
    var song = Get.arguments as Song? ?? Song.newSong();
    Rx<Song> rxSong = Rx<Song>(song);
    Get.lazyPut<EditorController>(() => EditorController(song: rxSong));
  }
}
