import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:sax_music_editor/modules/editor/models/sax_note.dart';

Future<Uint8List> generatePartiture(
    PdfPageFormat format, List<SaxNote> partiture) async {
  final doc = Document(title: 'Partiture', author: 'Sax Visual Music');

  final List<Widget> images = await _getImages(partiture);

  final pageTheme = await _myPageTheme(format);

  doc.addPage(
    MultiPage(
      pageTheme: pageTheme,
      build: (Context context) => [
        Partition(
          child: Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.start,
            children: images,
          ),
        ),
      ],
    ),
  );
  return doc.save();
}

Future<List<Widget>> _getImages(List<SaxNote> partiture) async {
  final List<Widget> imageWidgets = [];

  for (var note in partiture) {
    imageWidgets.add(
      Padding(
        padding: const EdgeInsets.only(right: 10, bottom: 5),
        child: Image(
          MemoryImage(
            (await rootBundle.load(note.imgUrl)).buffer.asUint8List(),
          ),
          width: 110,
        ),
      ),
    );
  }

  return imageWidgets;
}

Future<PageTheme> _myPageTheme(PdfPageFormat format) async {
  format = format.applyMargin(left: 0, top: 0, right: 0, bottom: 0);
  return PageTheme(
    pageFormat: format,
    theme: ThemeData.withFont(
      base: await PdfGoogleFonts.openSansRegular(),
      bold: await PdfGoogleFonts.openSansBold(),
      icons: await PdfGoogleFonts.materialIcons(),
    ),
  );
}
