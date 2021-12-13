import 'package:flutter/material.dart';
import 'package:sax_music_editor/globals/notes.dart';
import 'package:sax_music_editor/modules/editor/pages/widgets/selector/img_note.dart';

class NotesList extends StatelessWidget {
  NotesList({Key? key}) : super(key: key);

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              spreadRadius: 5,
              blurRadius: 4,
              offset: const Offset(1, 0),
            ),
          ],
        ),
        child: ListView.separated(
          controller: _controller,
          itemCount: scales.length,
          addAutomaticKeepAlives: true,
          padding: const EdgeInsets.symmetric(vertical: 15),
          itemBuilder: (context, index) {
            return ExpansionTile(
              title: Text("${scales[index]} Escala".toUpperCase()),
              children: notes
                  .map(
                    (note) => ImgNote(
                      id: notes.indexOf(note) + (index * notes.length),
                      imgRoute:
                          "assets/images/notes/${scales[index]}_escala/$note.png",
                      title: note,
                    ),
                  )
                  .toList(),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 15),
        ));
  }
}
