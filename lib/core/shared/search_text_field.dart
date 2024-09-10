import 'package:flutter/material.dart';
import 'package:qimah_admin/core/shared/custom_text_form_field.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomTextFormField(
        borderDecoration: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        textDirection: TextDirection.rtl,
        validator: (value) {
          return null;
        },
        label: 'ابحث هنا...',
        iconData: Icons.search,
      ),
    );
  }
}
