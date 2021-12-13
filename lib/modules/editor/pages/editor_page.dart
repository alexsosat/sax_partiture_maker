import 'package:flutter/material.dart';
import 'widgets/appbar.dart';
import 'widgets/selector/notes_list.dart';
import 'widgets/preview/page_list.dart';

class EditorPage extends StatelessWidget {
  const EditorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EditorAppbar(),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: NotesList(),
          ),
          Expanded(
            flex: 4,
            child: PageList(),
          ),
        ],
      ),
    );
  }
}
