import 'package:flutter/material.dart';
import 'package:qimah_admin/core/constant/app_enums.dart';
import 'package:qimah_admin/core/helper/functions/get_gender_name.dart';

class ChooseGenderRadioButton extends StatefulWidget {
  const ChooseGenderRadioButton(
      {super.key, this.defaultGender, required this.onChanged});
  final int? defaultGender;
  final void Function(String) onChanged;
  @override
  State<ChooseGenderRadioButton> createState() =>
      _ChooseGenderRadioButtonState();
}

class _ChooseGenderRadioButtonState extends State<ChooseGenderRadioButton> {
  GenderType _selectedType = GenderType.male;

  @override
  Widget build(BuildContext context) {
    if (widget.defaultGender != null) {
      _selectedType = toGenderType(widget.defaultGender!);
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 90, // Adjust the width as needed
          child: RadioListTile<GenderType>(
            contentPadding: EdgeInsets.zero,
            title: const Text(
              'ذكور',
            ),
            value: GenderType.male,
            groupValue: _selectedType,
            onChanged: (value) {
              setState(() {
                _selectedType = value!;
                widget.onChanged(value.name);
              });
            },
          ),
        ),
        SizedBox(
          width: 90, // Adjust the width as needed
          child: RadioListTile<GenderType>(
            contentPadding: EdgeInsets.zero,
            title: const Text(
              'اناث',
            ),
            value: GenderType.female,
            groupValue: _selectedType,
            onChanged: (value) {
              setState(() {
                _selectedType = value!;
                widget.onChanged(value.name);
              });
            },
          ),
        ),
      ],
    );
  }
}
