import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/colors/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentation/widgets/vedio_widget.dart';

class EveryOneWatchingWidget extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String movieDescription;
  const EveryOneWatchingWidget(
      {super.key,
      required this.posterPath,
      required this.movieName,
      required this.movieDescription});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        khight,
         Text(
          movieName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
         Text(
          movieDescription,
          style: TextStyle(color: kGrey, fontSize: 16),
        ),
        khight50,
        VedioWidget(posterPath: posterPath,),
        khight,
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              title: "Share",
              icon: Icons.telegram_outlined,
              iconSize: 25,
              textSize: 15,
            ),
            kWidth,
            CustomButton(
              title: "MyList",
              icon: Icons.add,
              iconSize: 25,
              textSize: 15,
            ),
            kWidth,
            CustomButton(
              title: "Play",
              icon: Icons.play_arrow,
              iconSize: 25,
              textSize: 15,
            ),
            kWidth
          ],
        )
      ],
    );
  }
}
