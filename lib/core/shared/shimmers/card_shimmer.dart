import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CardShimmer extends StatelessWidget {
  const CardShimmer({super.key, required this.height});

  final double height;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Shimmer.fromColors(
          direction: ShimmerDirection.rtl,
          baseColor: Colors.grey[400]!,
          highlightColor: Colors.grey[100]!,
          child: Card(
            elevation: 3,
            child: SizedBox(
              height: height,
            ),
          )),
    );
  }
}
