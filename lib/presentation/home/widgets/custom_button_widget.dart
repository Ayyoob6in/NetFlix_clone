import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final double iconSize;
  final double textSize;
  const CustomButton({
    super.key,
    required this.title,
    required this.icon,
    this.iconSize = 25,
    this.textSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kwhite,
          size: iconSize,
        ),
        Text(
          title,
          style: TextStyle(
              color: kwhite, fontSize: textSize, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
