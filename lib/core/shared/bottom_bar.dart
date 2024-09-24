import 'package:flutter/material.dart';
import 'package:qimah_admin/core/constant/app_assets.dart';
import 'package:qimah_admin/core/constant/app_color.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      color: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildIcon(context, Assets.assetsImagesPerson2, 0),
            _buildIcon(context, Assets.assetsImagesBell, 1),
            _buildIcon(context, Assets.assetsImagesSearch, 2),
            _buildIcon(context, Assets.assetsImagesHome, 3),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(BuildContext context, String asset, int index) {
    bool isSelected = selectedIndex == index;

    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _onItemTapped(index),
          customBorder: const CircleBorder(),
          splashColor: AppColor.secondaryColor.withOpacity(0.3),
          highlightColor: AppColor.secondaryColor.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              asset,
              width: 26,
              height: 26,
              color: isSelected ? AppColor.secondaryColor : AppColor.white,
            ),
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    DefaultTabController.of(context).animateTo(index);
  }
}
