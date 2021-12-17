import 'package:flutter/material.dart';
import 'package:get/get.dart';

void snackbarMessage({required String title, String message = ""}) {
  Get.snackbar(
    title,
    "",
    messageText: Text(message),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: (Get.isDarkMode) ? Colors.grey[800] : Colors.white,
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    boxShadows: <BoxShadow>[
      BoxShadow(
        color: Colors.grey[800]!.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, 3), // changes position of shadow
      ),
    ],
    isDismissible: false,
  );
}

void openDialogWindow(
    {required String title,
    required String message,
    Function? onCancel,
    Function? onConfirm}) {
  Get.dialog(
    AlertDialog(
      title: Text(title, textAlign: TextAlign.center),
      contentPadding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: Text(message, textAlign: TextAlign.center)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              OutlinedButton(
                onPressed: onCancel as void Function()?,
                child: Text(
                  "Cancelar",
                  style: TextStyle(
                    color: (Get.isDarkMode) ? Colors.white : Colors.grey[800],
                  ),
                ),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                onPressed: onConfirm as void Function()?,
                child: const Text(
                  "Confirmar",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
    barrierDismissible: false,
  );
}
