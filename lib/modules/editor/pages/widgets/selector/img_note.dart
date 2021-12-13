import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sax_music_editor/modules/editor/controllers/editor_controller.dart';
import 'package:sax_music_editor/modules/editor/models/sax_note.dart';

class ImgNote extends GetView<EditorController> {
  final int id;
  final String imgRoute;
  final String title;

  const ImgNote({
    Key? key,
    required this.imgRoute,
    required this.id,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => controller.song.update(
        (val) => val!.partiture.add(
          SaxNote(
            id: id,
            name: title,
            imgUrl: imgRoute,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Image.asset(
              imgRoute,
              height: 210,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
      ),
    );
  }
}
