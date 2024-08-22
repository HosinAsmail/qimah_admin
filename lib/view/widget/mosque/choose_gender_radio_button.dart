import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qimah_admin/bloc/mosque%20blocs/create%20mosque%20bloc/create_mosque_bloc.dart';
import 'package:qimah_admin/core/constant/app_enums.dart';

class ChooseGenderRadioButton extends StatefulWidget {
  const ChooseGenderRadioButton({super.key});
  @override
  State<ChooseGenderRadioButton> createState() =>
      _ChooseGenderRadioButtonState();
}

class _ChooseGenderRadioButtonState extends State<ChooseGenderRadioButton> {
  GenderType _selectedType = GenderType.male;

  @override
  Widget build(BuildContext context) {
    context.read<CreateMosqueBloc>().courseGenderController.text =
        convertToNumber(_selectedType).toString();
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
              });
            },
          ),
        ),
      ],
    );
  }

  int convertToNumber(GenderType gender) {
    if (gender == GenderType.male) {
      return 1;
    } else {
      return 0;
    }
  }
}
