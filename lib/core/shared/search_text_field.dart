import 'package:flutter/material.dart';
import 'package:qimah_admin/core/shared/custom_text_form_field.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 10, 18, 20),
      child: CustomTextFormField(
        borderDecoration: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
        textDirection: TextDirection.rtl,
        validator: (value) {
          return null;
        },
        hintText: 'ابحث هنا...',
        iconData: Icons.search,
      ),
    );
  }
}
