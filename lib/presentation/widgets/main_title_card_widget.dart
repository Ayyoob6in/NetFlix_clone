import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/constants.dart';
import 'package:netflix_clone/infrastructure/models/movies/movies.dart';
import 'package:netflix_clone/presentation/widgets/main_card_widget.dart';
import 'package:netflix_clone/presentation/widgets/main_titile_widget.dart';

class MainTitleCardWidget extends StatelessWidget {
  final String title;
  final List<String>posterList;
  const MainTitleCardWidget({
    super.key,
    required this.title,
    required this.posterList

  });

  @override
 
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        khight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              posterList.length, (index) => MainCardWidget(
                imageUrl: posterList[index],
              )),
          ),
        )
      ],
    );
  }
}

late Future<List<Movie>> trendingMovies;
final AsyncSnapshot snapshot = snapshot;
