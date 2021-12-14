import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:sax_music_editor/modules/editor/pages/widgets/overlays.dart';
import 'package:sax_music_editor/modules/pdf_viewer/pages/widgets/appbar.dart';

import 'package:sax_music_editor/modules/pdf_viewer/pages/widgets/generate_partiture.dart';
import 'package:sax_music_editor/modules/projects/models/song.dart';

class PdfViewer extends StatelessWidget {
  const PdfViewer({Key? key}) : super(key: key);

  Future<void> _saveAsFile(
    BuildContext context,
    LayoutCallback build,
    PdfPageFormat pageFormat,
    String documentName,
  ) async {
    final bytes = await build(pageFormat);

    final appDocDir = await getApplicationDocumentsDirectory();
    final appDocPath = appDocDir.path;
    final file =
        File(appDocPath + "/" + "SaxMusicMaker" + '/' + '$documentName.pdf');
    file.createSync(recursive: true);
    snackbarMessage(title: "Guardado en ${file.path} ...");
    await file.writeAsBytes(bytes);
    await OpenFile.open(file.path);
  }

  @override
  Widget build(BuildContext context) {
    final song = ModalRoute.of(context)!.settings.arguments as Song;

    final actions = <PdfPreviewAction>[
      if (!kIsWeb)
        PdfPreviewAction(
          icon: const Icon(Icons.save),
          onPressed: (context, build, pageFormat) =>
              _saveAsFile(context, build, pageFormat, song.title),
        )
    ];

    return Scaffold(
      appBar: const ViewerAppBar(),
      body: PdfPreview(
        maxPageWidth: 700,
        build: (format) => generatePartiture(format, song.partiture),
        actions: actions,
        canDebug: false,

        // onPrinted: _showPrintedToast,
        // onShared: _showSharedToast,
      ),
    );
  }
}
