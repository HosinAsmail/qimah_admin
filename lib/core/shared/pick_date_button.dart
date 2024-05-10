import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qimah_admin/core/helper/functions/select_date.dart';

class PickDateButton extends StatefulWidget {
  const PickDateButton({
    super.key,
    required this.initialDate,
    required this.text,
    required this.onGot,
  });
  final DateTime? initialDate;
  final void Function(DateTime) onGot;
  final String text;
  @override
  State<PickDateButton> createState() => _PickDateButtonState();
}

class _PickDateButtonState extends State<PickDateButton> {
  DateTime? dateTime;
  @override
  Widget build(BuildContext context) {
    dateTime ??= widget.initialDate;
    return Row(
      children: [
        Text(
          widget.text,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: TextButton(
            child: dateTime == null
                ? const Text("اختر")
                : Text(DateFormat('yyyy/MM/dd', "en").format(dateTime!)),
            onPressed: () async {
              DateTime? picked = await selectDate(context, dateTime);
              if (picked != null) {
                setState(() {
                  dateTime = picked;
                  widget.onGot(picked);
                });
              }
            },
          ),
        ),
      ],
    );
  }
}
