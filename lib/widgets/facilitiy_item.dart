import '../theme.dart';
import 'package:flutter/material.dart';

class FacilityItem extends StatelessWidget {
  final String? name;
  final String? imageUrl;
  final int? total;

  FacilityItem({this.imageUrl, this.name, this.total});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl ?? '',
          height: 32,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '$total',
                style: purpleTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
              TextSpan(
                text: ' $name',
                style: greyTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
