import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sax_music_editor/modules/editor/controllers/editor_controller.dart';
import 'package:sax_music_editor/modules/editor/models/sax_note.dart';

class NotePreview extends StatefulWidget {
  final SaxNote note;
  final int index;
  const NotePreview({
    Key? key,
    required this.note,
    required this.index,
  }) : super(key: key);

  @override
  _NotePreviewState createState() => _NotePreviewState();
}

class _NotePreviewState extends State<NotePreview> {
  final controller = Get.find<EditorController>();
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () => setState(() {
            isSelected = !isSelected;
          }),
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: isSelected
                ? BoxDecoration(
                    border: Border.all(
                    color: Colors.red,
                    width: 5,
                  ))
                : null,
            child: Image.asset(
              widget.note.imgUrl,
              height: 200,
            ),
          ),
        ),
        if (isSelected)
          SizedBox(
            height: 200,
            width: 190,
            child: Align(
              alignment: Alignment.topRight,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isSelected = !isSelected;
                  });
                  controller.song.update((val) {
                    val!.partiture.removeAt(widget.index);
                  });
                },
                child: const Icon(Icons.close, color: Colors.white),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(const CircleBorder()),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                  backgroundColor: MaterialStateProperty.all(
                      Colors.blue), // <-- Button color
                  overlayColor:
                      MaterialStateProperty.resolveWith<Color?>((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.red;
                    } // <-- Splash color
                  }),
                ),
              ),
            ),
          )
      ],
    );
  }
}
