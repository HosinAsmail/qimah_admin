import 'package:qimah_admin/core/helper/functions/my_snack_bar.dart';
import 'package:qimah_admin/core/helper/functions/valid_input_function.dart';
import 'package:qimah_admin/core/shared/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

class EditText extends StatelessWidget {
  EditText({
    super.key,
    required this.mainText,
    required this.iconData,
    required this.defaultValue,
  });
  final String mainText;
  final TextEditingController textController = TextEditingController();
  final IconData iconData;
  final String? defaultValue;
  @override
  Widget build(BuildContext context) {
    if (defaultValue != null) {
      textController.text = defaultValue!;
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormField(
              autoFocus: true,
              hintText: mainText,
              label: "الرجاء إدخال $mainText ",
              suffix: Icon(iconData),
              controller: textController,
              validator: (value) {
                return validInput(value!.trim(), 1, 7, 'text');
              },
              keyboardType: TextInputType.text),
          const SizedBox(
            height: 26,
          ),
          ElevatedButton(
              onPressed: () {
                if (textController.text.isNotEmpty) {
                  Get.back(result: textController.text);
                } else if (textController.text.isEmpty) {
                  mySnackBar(ToastificationType.error, 'خطأ',
                      'الرجاء إدخال $mainText ');
                }
              },
              child: Text('تعديل $mainText'))
        ],
      ),
    );
  }
}
