import 'package:qimah_admin/core/shared/shimmers/card_shimmer.dart';
import 'package:flutter/material.dart';

class ListCardShimmer extends StatelessWidget {
  const ListCardShimmer({
    super.key,
    required this.length,
    required this.uintHeight,
    required this.listHeight,
  });
  final int length;
  final double uintHeight;
  final double listHeight;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: listHeight,
      child: ListView(
        children:
            List.generate(length, (index) => CardShimmer(height: uintHeight)),
      ),
    );
  }
}
