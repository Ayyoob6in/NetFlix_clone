import 'package:flutter/cupertino.dart';
import 'package:netflix_clone/core/colors/constants.dart';

class MainCardWidget extends StatelessWidget {
  final String imageUrl;
  const MainCardWidget({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 130,
      height: 250,
      decoration: BoxDecoration(
          borderRadius: kRadius20,
          image:  DecorationImage(
              image: NetworkImage(
                imageUrl,
              ),
              fit: BoxFit.cover)),
    );
  }
}
