import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> showCustomDialog(
    BuildContext context, String action, String actionContent,
    {required void Function() onPressed}) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('تأكيد $action'),
        content: Text('هل أنت متأكد أنك تريد $actionContent'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('إلغاء'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
            ),
            onPressed: () {
              onPressed.call();
              Get.back();
            },
            child: Text(action.substring(2)), // remove ال
          ),
        ],
      );
    },
  );
}
