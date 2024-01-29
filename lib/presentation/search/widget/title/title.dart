import 'package:flutter/material.dart';

class SearchTextTitle extends StatelessWidget {
  const SearchTextTitle({super.key, required this.titile});
  final String titile;

  @override
  Widget build(BuildContext context) {
    return Text(
      titile,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}
