import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CardShimmerLinearLowHeight extends StatelessWidget {
  const CardShimmerLinearLowHeight({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Shimmer.fromColors(
          direction: ShimmerDirection.rtl,
          baseColor: Colors.grey[400]!,
          highlightColor: Colors.grey[100]!,
          child: const Card(
            elevation: 3,
            child: SizedBox(
              height: 100,
            ),
          )),
    );
  }
}
