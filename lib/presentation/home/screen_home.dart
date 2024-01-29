import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/home/bloc/home_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/colors/constants.dart';
import 'package:netflix_clone/infrastructure/models/movies/movies.dart';
import 'package:netflix_clone/presentation/home/widgets/background_card_widget.dart';
import 'package:netflix_clone/presentation/home/widgets/number_titlt_card.dart';
import 'package:netflix_clone/presentation/widgets/main_title_card_widget.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
     WidgetsBinding.instance.addPostFrameCallback((_) {
       BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    },);
   
    return Scaffold(
        body: SafeArea(
      child: ValueListenableBuilder(
          valueListenable: scrollNotifier,
          builder: ((BuildContext context, value, _) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection direction = notification.direction;
                if (direction == ScrollDirection.reverse) {
                  scrollNotifier.value = false;
                } else if (direction == ScrollDirection.forward) {
                  scrollNotifier.value = true;
                }
                return true;
              },
              child: Stack(
                children: [
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if(state.isLoading){
                        return const Center(child: CircularProgressIndicator(strokeWidth: 2,),);
                      }else if(state.isError){
                        return Center(child: Text("Error while getting Data"),
                        
                        );
                      }

                      final _releasePastYear = state.pastYearMovieList.map((e) {
                        return '$imgaeAppendUrl${e.posterPath}';
                      },).toList();

                      
                      return ListView(
                                      children:  [
                                        BackGroundCardWidget(),
                                        MainTitleCardWidget(
                                          title: "Released in the past year",
                                          posterList: _releasePastYear,
                                        ),
                                        MainTitleCardWidget(
                                          title: "trending",
                                          posterList: [],
                                          ),
                                        NumberTitleCardWidget(),
                                        MainTitleCardWidget(
                                          title: "Tense Dramas",
                                          posterList: [],
                                          ),
                                        MainTitleCardWidget(
                                          title: "South Indian Cinema",
                                          posterList: [],
                                        )
                                      ],
                                    );
                    },
                  ),
                  scrollNotifier.value == true
                      ? AnimatedContainer(
                          duration: const Duration(milliseconds: 2000),
                          width: double.infinity,
                          height: 80,
                          color: Colors.black.withOpacity(0.8),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      "https://www.freepnglogos.com/uploads/netflix-logo-app-png-16.png",
                                      height: 50,
                                      width: 50,
                                    ),
                                    const Spacer(),
                                    const Icon(
                                      Icons.cast,
                                      color: kwhite,
                                      size: 30,
                                    ),
                                    kWidth,
                                    Container(
                                      height: 30,
                                      width: 30,
                                      color: Colors.blue,
                                    ),
                                    kWidth
                                  ],
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("TV Shows", style: kHometitle),
                                    Text(
                                      "Movies",
                                      style: kHometitle,
                                    ),
                                    Text(
                                      "catagories",
                                      style: kHometitle,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      : khight
                ],
              ),
            );
          })),
    ));
  }
}

late Future<List<Movie>> trendingMovies;
