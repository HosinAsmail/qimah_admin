import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:qimah_admin/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomDropDownSearch extends StatefulWidget {
  const CustomDropDownSearch(
      {super.key,
      required this.title,
      required this.data,
      this.enableMultipleSelection = false,
      required this.selectedItems,
      this.initialValue});
  final String title;
  final String? initialValue;
  final List<SelectedListItem> data;
  final bool enableMultipleSelection;
  final dynamic Function(List<SelectedListItem>) selectedItems;
  @override
  State<CustomDropDownSearch> createState() => _CustomDropDownSearchState();
}

class _CustomDropDownSearchState extends State<CustomDropDownSearch> {
  TextEditingController nameController = TextEditingController();
  void showDropDown() {
    DropDownState(
      DropDown(
        isDismissible: true,
        bottomSheetTitle: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: Text(
          S.of(context).onboarding_done,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: widget.data,
        selectedItems: (selectedItems) {
          widget.selectedItems.call(selectedItems);
          nameController.text = selectedItems[0].name;
        },
        enableMultipleSelection: widget.enableMultipleSelection,
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.initialValue != null) {
      nameController.text = widget.initialValue!;
    }
    return TextFormField(
      onTap: () {
        showDropDown();
      },
      keyboardType: TextInputType.none,
      readOnly: true,
      controller: nameController,
      decoration: InputDecoration(
          hintText:
              nameController.text == "" ? widget.title : nameController.text,
          hintStyle: const TextStyle(fontSize: 12),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 9),
              child: Text(nameController.text == ""
                  ? widget.title
                  : nameController.text)),
          suffixIcon: IconButton(
              onPressed: () {
                showDropDown();
              },
              icon: const Icon(Icons.arrow_drop_down)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 30, vertical: 5)),
    );
  }
}
