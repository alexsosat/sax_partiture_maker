import 'package:get/get_navigation/get_navigation.dart';
import 'package:sax_music_editor/modules/editor/bindings/editor_binding.dart';
import 'package:sax_music_editor/modules/editor/pages/editor_page.dart';
import 'package:sax_music_editor/modules/home/home_page.dart';
import 'package:sax_music_editor/modules/pdf_viewer/pages/pdf_viewer.dart';
import 'package:sax_music_editor/modules/projects/bindings/song_selection_binding.dart';
import 'package:sax_music_editor/modules/projects/pages/song_selection_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const inital = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomePage(),
    ),
    GetPage(
      name: _Paths.editor,
      page: () => const EditorPage(),
      binding: EditorBinding(),
    ),
    GetPage(
      name: _Paths.viewer,
      page: () => const PdfViewer(),
    ),
    GetPage(
      name: _Paths.projects,
      binding: SongSelectionBinding(),
      page: () => const SongSelectionPage(),
    ),
  ];
}
