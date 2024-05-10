import 'package:qimah_admin/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    super.key,
    required this.hintText,
    required this.searchController,
    required this.onPressed,
  });
  final String hintText;
  final TextEditingController searchController;
  final void Function() onPressed;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  bool isStartSearching = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.searchController,
      cursorColor: AppColor.primaryColor,
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            isStartSearching = true;
          });
        } else {
          setState(() {
            isStartSearching = false;
          });
        }
      },
      onSubmitted: (value) {
        widget.onPressed.call();
        print("subitted");
      },
      autofocus: true,
      decoration: InputDecoration(
        fillColor: const Color.fromARGB(150, 255, 218, 105),
        filled: true,
        hintText: widget.hintText,
        prefixIcon: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black.withAlpha(150),
          onPressed: () {
            Get.back();
          },
        ),
        suffixIcon: isStartSearching
            ? IconButton(
                padding: const EdgeInsets.only(left: 20, right: 10),
                onPressed: () {
                  widget.searchController.clear();
                },
                icon: Icon(
                  Icons.close,
                  color: Colors.black.withAlpha(150),
                ),
              )
            : null,
        suffix: isStartSearching
            ? IconButton(
                padding: const EdgeInsets.only(top: 1),
                onPressed: widget.onPressed,
                icon: Icon(
                  Icons.search,
                  color: Colors.black.withAlpha(150),
                ))
            : null,
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.primaryColor, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(100))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.primaryColor, width: 2.5),
            borderRadius: BorderRadius.all(Radius.circular(100))),
      ),
    );
  }
}
