import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qimah_admin/core/shared/bottom_bar.dart';
import 'package:qimah_admin/view/screens/base/profile_screen.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int initialIndex = 1; //Get.arguments['initialIndex'];
    return DefaultTabController(
      length: 4,
      initialIndex: initialIndex,
      child: Scaffold(
        body: PopScope(
          onPopInvoked: (value) {
            if (value == true) {
              exit(0);
            }
          },
          child: const TabBarView(
            children: [
              ProfileScreen(),
              Text('NotificationScreen()'),
              Text('SearchScreen()'),
              Text('SearchScreen()'),
            ],
          ),
        ),
        bottomNavigationBar: const BottomBar(),
      ),
    );
  }
}
