import '../theme.dart';
import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  final int? rating;
  const RatingItem({
    Key? key,
    this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> ratingItems = [];
    for (var i = 1; i < 6; i++) {
      ratingItems.add(
        Image.asset(
          'assets/icon/icon_star.png',
          width: 20,
          color: i < rating! ? null : const Color(0xff989BA1),
        ),
      );
    }
    return Row(
      children: ratingItems,
    );
  }
}
