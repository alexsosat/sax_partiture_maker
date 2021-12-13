import 'package:get/get.dart';
import 'package:sax_music_editor/modules/projects/controller/song_selection_controller.dart';

class SongSelectionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SongSelectionController>(() => SongSelectionController());
  }
}
