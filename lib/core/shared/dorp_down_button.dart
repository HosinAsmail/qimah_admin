import 'package:flutter/material.dart';

class ChooseDropDownButton extends StatefulWidget {
  const ChooseDropDownButton(
      {super.key,
      required this.items,
      this.hint,
      this.defaultValue,
      required this.onChanged});
  final String? defaultValue;
  final List<String> items;
  final String? hint;
  final void Function(String) onChanged;
  @override
  State<ChooseDropDownButton> createState() => _ChooseDropDownButtonState();
}

class _ChooseDropDownButtonState extends State<ChooseDropDownButton> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    if (widget.defaultValue != null && // -1
            selectedValue == null && // -2
            widget.items.contains(widget.defaultValue) // -3
        ) {
      selectedValue = widget.defaultValue;
    }
    return DropdownButton<String>(
      value: selectedValue,
      hint: widget.hint == null ? null : Text(widget.hint!),
      items: widget.items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? value) {
        if (value != null) {
          setState(() {
            selectedValue = value;
            widget.onChanged(value);
          });
        }
      },
    );
  }
}
