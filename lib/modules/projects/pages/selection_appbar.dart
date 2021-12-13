import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectionAppBar extends StatelessWidget with PreferredSizeWidget {
  const SelectionAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Lista de canciones"),
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
