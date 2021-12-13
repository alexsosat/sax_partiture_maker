import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:sax_music_editor/modules/editor/models/sax_note.dart';
import 'package:sax_music_editor/modules/pdf_viewer/pages/widgets/appbar.dart';

import 'package:sax_music_editor/modules/pdf_viewer/pages/widgets/generate_partiture.dart';

class PdfViewer extends StatelessWidget {
  const PdfViewer({Key? key}) : super(key: key);

  Future<void> _saveAsFile(
    BuildContext context,
    LayoutCallback build,
    PdfPageFormat pageFormat,
  ) async {
    final bytes = await build(pageFormat);

    final appDocDir = await getApplicationDocumentsDirectory();
    final appDocPath = appDocDir.path;
    final file = File(appDocPath + '/' + 'document.pdf');
    print('Save as file ${file.path} ...');
    await file.writeAsBytes(bytes);
    await OpenFile.open(file.path);
  }

  @override
  Widget build(BuildContext context) {
    final partiture =
        ModalRoute.of(context)!.settings.arguments as List<SaxNote>;

    final actions = <PdfPreviewAction>[
      if (!kIsWeb)
        PdfPreviewAction(
          icon: const Icon(Icons.save),
          onPressed: _saveAsFile,
        )
    ];

    return Scaffold(
      appBar: const ViewerAppBar(),
      body: PdfPreview(
        maxPageWidth: 700,
        // build: (format) => generateResume(format, const CustomData()),
        build: (format) => generatePartiture(format, partiture),
        actions: actions,
        canDebug: false,

        // onPrinted: _showPrintedToast,
        // onShared: _showSharedToast,
      ),
    );
  }
}
