import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reorderables/reorderables.dart';
import 'package:sax_music_editor/modules/editor/controllers/editor_controller.dart';
import 'package:sax_music_editor/modules/editor/models/sax_note.dart';
import 'package:sax_music_editor/modules/editor/pages/widgets/preview/note_preview.dart';

class PageList extends StatelessWidget {
  PageList({Key? key}) : super(key: key);

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    _buildPreview(List<SaxNote> partiture) {
      List<Widget> partitureWidgets = List<Widget>.empty(growable: true);

      for (int i = 0; i < partiture.length; i++) {
        partitureWidgets.add(
          NotePreview(
            index: i,
            note: partiture[i],
          ),
        );
      }

      return partitureWidgets;
    }

    return GetX<EditorController>(builder: (controller) {
      return SizedBox(
        height: 750,
        width: 563,
        child: ReorderableWrap(
          controller: _controller,
          spacing: 8.0,
          runSpacing: 4.0,
          padding: const EdgeInsets.all(8),
          children: _buildPreview(controller.song.value.partiture),
          onReorder: controller.onReorder,
        ),
      );
    });
  }
}
