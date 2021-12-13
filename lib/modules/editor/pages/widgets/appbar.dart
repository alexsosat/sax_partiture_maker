import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sax_music_editor/modules/editor/controllers/editor_controller.dart';
import 'package:sax_music_editor/routes/app_pages.dart';

class EditorAppbar extends GetView<EditorController> with PreferredSizeWidget {
  EditorAppbar({Key? key}) : super(key: key);

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _textEditingController.text = controller.title;
    return AppBar(
      title: Theme(
        data: Theme.of(context).copyWith(
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: Colors.grey.shade600,
          ),
        ),
        child: TextField(
          controller: _textEditingController,
          cursorColor: Colors.white,
          style: Theme.of(context).textTheme.headline5!.copyWith(
                fontWeight: FontWeight.bold,
              ),
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          onChanged: (value) => controller.title = value,
        ),
      ),
      backgroundColor: Colors.blueAccent,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(Icons.chevron_left),
        tooltip: "Regresar",
      ),
      actions: [
        IconButton(
          onPressed: () => controller.saveSong(),
          icon: const Icon(Icons.save),
          tooltip: "Guardar proyecto",
        ),
        IconButton(
          onPressed: () =>
              Get.toNamed(Routes.viewer, arguments: controller.partiture),
          icon: const Icon(Icons.picture_as_pdf_sharp),
          tooltip: "Crear PDF",
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
