import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/colors/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 200,
            ),
            Container(
              width: 130,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: kRadius20,
                  image: const DecorationImage(
                      image: NetworkImage(
                        "https://www.themoviedb.org/t/p/w1280/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg",
                      ),
                      fit: BoxFit.cover)),
            ),
          ],
        ),
        Positioned(
          left: 13,
          bottom: -49,
          child: BorderedText(
            strokeColor: Colors.white,
            strokeWidth: 5,
            child: Text(
              "${index + 1}",
              style: const TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 150,
                  color: kBlack,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
