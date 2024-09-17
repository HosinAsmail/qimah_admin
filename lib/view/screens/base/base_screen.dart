import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qimah_admin/core/shared/bottom_bar.dart';
import 'package:qimah_admin/view/screens/base/profile/Profile_screen.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int initialIndex = 0;
    return DefaultTabController(
      length: 4,
      initialIndex: initialIndex,
      child: Scaffold(
        extendBody: true, // هذا يجعل الـ body يمتد خلف الـ bottomNavigationBar
        body: PopScope(
          onPopInvoked: (value) {
            if (value == true) {
              exit(0);
            }
          },
          child: const TabBarView(
            children: [
              ProfileScreen(),
              Center(child: Text('NotificationScreen()')),
              Center(child: Text('SearchScreen()')),
              Center(child: Text('HomeScreen()')),
            ],
          ),
        ),
        bottomNavigationBar: const BottomBar(),
      ),
    );
  }
}
