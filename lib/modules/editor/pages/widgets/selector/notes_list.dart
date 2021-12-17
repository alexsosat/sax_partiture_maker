import 'package:flutter/material.dart';
import 'package:sax_music_editor/globals/notes.dart';
import 'package:sax_music_editor/modules/editor/pages/widgets/selector/img_note.dart';

class NotesList extends StatelessWidget {
  NotesList({Key? key}) : super(key: key);

  final ScrollController _controller = ScrollController();

  String _getAudioRoute(String scaleName, String note) {
    note = note.replaceAll(RegExp(r'#'), '2');
    return "assets/audios/${scaleName}_escala/$note.mp3";
  }

  List<Widget> _getScaleNotes(
      String scaleName, int scaleLength, bool isReversed) {
    List<Widget> widgetNotes = List<Widget>.empty(growable: true);

    if (!isReversed) {
      for (int i = 0; i < scaleLength; i++) {
        widgetNotes.add(
          ImgNote(
            imgRoute: "assets/images/notes/${scaleName}_escala/${notes[i]}.png",
            audioRoute: _getAudioRoute(scaleName, notes[i]),
            title: notes[i],
          ),
        );
      }
    } else {
      int iterations = notes.length - scaleLength;
      for (int i = notes.length - 1; i >= iterations; i--) {
        widgetNotes.add(
          ImgNote(
            imgRoute: "assets/images/notes/${scaleName}_escala/${notes[i]}.png",
            audioRoute: _getAudioRoute(scaleName, notes[i]),
            title: notes[i],
          ),
        );
      }
    }

    return widgetNotes;
  }

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
            Map<String, dynamic> scale = scales[index];
            return ExpansionTile(
              title: Text("${scale['name']} Escala".toUpperCase()),
              children: _getScaleNotes(
                  scale['name'], scale['notes_count'], scale["reverse"]),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 15),
        ));
  }
}
