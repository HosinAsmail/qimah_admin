import 'package:qimah_admin/core/helper/functions/my_snack_bar.dart';
import 'package:qimah_admin/core/helper/functions/valid_input_function.dart';
import 'package:qimah_admin/core/shared/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:qimah_admin/core/constant/app_color.dart';

class EditNumber extends StatelessWidget {
  EditNumber({
    super.key,
    required this.mainText,
    required this.iconData,
    required this.defaultValue,
  });
  final String mainText;
  final TextEditingController numberController = TextEditingController();
  final IconData iconData;
  final String? defaultValue;
  @override
  Widget build(BuildContext context) {
    if (defaultValue != null) {
      numberController.text = defaultValue!;
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
              hintText: mainText,
              autoFocus: true,
              label: "الرجاء إدخال $mainText ",
              iconData: iconData,
              controller: numberController,
              validator: (value) {
                return validInput(value!.trim(), 1, 50, 'number');
              },
              keyboardType: TextInputType.number),
          const SizedBox(
            height: 26,
          ),
          ElevatedButton(
              onPressed: () {
                String? errorMessage =
                    validInput(numberController.text.trim(), 1, 50, 'number');
                mySnackBar(AppColor.failure, 'خطأ', errorMessage ?? "");
              },
              child: Text('تعديل $mainText'))
        ],
      ),
    );
  }
}
