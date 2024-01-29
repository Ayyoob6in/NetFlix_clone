import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/colors/constants.dart';
import 'package:netflix_clone/presentation/widgets/vedio_widget.dart';

import '../../home/widgets/custom_button_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String day;
  final String month;
  final String posterPath;
  final String movieName;
  final String movieDescription;
  const ComingSoonWidget(
      {super.key,
      required this.id,
      required this.day,
      required this.month,
      required this.posterPath,
      required this.movieName,
      required this.movieDescription});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      children: [
         SizedBox(
          width: 50,
          height: 480,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                month,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: kGrey,
                ),
              ),
              Text(
                day,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 600,
           
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               VedioWidget(posterPath: posterPath),
              Row(
                children: [
                  Text(
                    movieName,
                    style: GoogleFonts.cinzelDecorative(
                      fontSize: 15,
                    ),
                  ),
                  const Spacer(),
                  const Row(
                    children: [
                      CustomButton(
                        title: "Remind Me",
                        icon: Icons.all_out,
                        iconSize: 22,
                        textSize: 10,
                      ),
                      kWidth,
                      CustomButton(
                        title: "Info",
                        icon: Icons.info_outline,
                        iconSize: 22,
                        textSize: 10,
                      ),
                      kWidth,
                    ],
                  )
                ],
              ),
              khight,
               Text("Coming $day Friday $month"),
              Image.network(
                "https://pngimg.com/uploads/netflix/netflix_PNG26.png",
                height: 40,
                fit: BoxFit.cover,
              ),
               Text(
                movieName,
                style:const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              khight,
               Text(
                movieDescription,
                style: TextStyle(color: kGrey, fontSize: 13),
              
              ),
              SizedBox(height: 40,)
            ],
          ),
        ),
      ],
    );
  }
}
