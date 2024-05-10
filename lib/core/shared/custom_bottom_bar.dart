import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:qimah_admin/core/constant/app_bar_pages.dart';
import 'package:qimah_admin/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar.badge(const {3: ''},
        backgroundColor: AppColor.primaryColor,
        height: 56,
        color: Colors.white,
        elevation: 5,
        items: [
          for (final page in pages.entries)
            TabItem(
                icon: Icon(
              page.value,
              color: Colors.black.withAlpha(200),
            ))
        ]);
  }
}
