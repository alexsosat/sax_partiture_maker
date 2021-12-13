import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewerAppBar extends StatelessWidget with PreferredSizeWidget {
  const ViewerAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Visualizador PDF"),
      backgroundColor: Colors.blueAccent,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(Icons.chevron_left),
        tooltip: "Regresar",
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
