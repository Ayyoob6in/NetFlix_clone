import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/colors/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';

class BackGroundCardWidget extends StatelessWidget {
  const BackGroundCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(kMainImage), fit: BoxFit.cover),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButton(
                  title: "My List",
                  icon: Icons.add,
                ),
                _playButton(),
                const CustomButton(title: "Info", icon: Icons.info_outline)
              ],
            ),
          ),
        )
      ],
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow,
        size: 25,
        color: kBlack,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(vertical: 4),
        child: Text(
          "Play",
          style: TextStyle(fontSize: 20, color: kBlack),
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kwhite),
        shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        fixedSize: const MaterialStatePropertyAll(Size(120, 50)),
      ),
    );
  }
}
