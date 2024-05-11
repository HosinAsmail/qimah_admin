import 'package:qimah_admin/core/constant/app_color.dart';
import 'package:qimah_admin/core/extension/string_extensions.dart';
import 'package:qimah_admin/core/helper/functions/my_snack_bar.dart';
import 'package:qimah_admin/core/helper/functions/valid_input_function.dart';
import 'package:qimah_admin/core/shared/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

Future<int?> getInvoiceByNumberDialog(context) async {
  TextEditingController invoiceNumberController = TextEditingController();
  return showDialog<int>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'بحث برقم الفاتورة',
          textAlign: TextAlign.center,
        ),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormField(
                  hintText: "رقم الفاتورة",
                  label: "أدخل رقم الفاتورة",
                  suffix: const Icon(FontAwesomeIcons.fileInvoice),
                  controller: invoiceNumberController,
                  validator: (value) {
                    return validInput(value!.trim(), 1, 20, 'number');
                  },
                  keyboardType: TextInputType.number),
              const SizedBox(
                height: 26,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (invoiceNumberController.text.isNotEmpty) {
                      Get.back(result: invoiceNumberController.text.toInt());
                    } else if (invoiceNumberController.text.isEmpty) {
                      mySnackBar(
                        AppColor.failure,
                        'خطأ',
                        'الرجاء إدخال الرقم ',
                      );
                    }
                  },
                  child: const Text('بحث'))
            ],
          ),
        ),
      );
    },
  );
}
