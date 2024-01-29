import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/bloc/downloads_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/colors/constants.dart';
import 'package:netflix_clone/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  final _widgetList = [
    const _SmartDownloads(),
    Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadImages());
    });

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(45),
        child: AppBarWidget(title: "Downloads"),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemBuilder: (ctx, index) => _widgetList[index],
        separatorBuilder: (ctx, index) => const SizedBox(height: 25),
        itemCount: _widgetList.length,
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({super.key});
  // final imagesList = [
  //   "https://i.pinimg.com/474x/2d/6e/7c/2d6e7cefd9bc7fbd0874cb5cc65c0054.jpg",
  //   "https://i.pinimg.com/474x/6e/0b/3d/6e0b3d22f8b5cf0eb05c60ea1232cb8f.jpg",
  //   "https://i.pinimg.com/474x/1e/41/86/1e418611c7ccbfe62328702b5599acf8.jpg"
  // ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Text(
          "Introducing Downloads for you",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: kwhite,
          ),
        ),
        khight,
        const Text(
          "We will download personalized selections of\n movies and shows for you, "
          "so there is\n always something to watch on your \ndevice.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return state.downloads.isNotEmpty
                ? SizedBox(
                    height: size.width,
                    width: size.width,
                    child: state.isLoading
                        ? Center(child: CircularProgressIndicator())
                        : Stack(
                            alignment: Alignment.center,
                            children: [
                              Center(
                                child: CircleAvatar(
                                  radius: size.width * 0.39,
                                  backgroundColor: Colors.grey.withOpacity(0.5),
                                ),
                              ),
                              DownloadsImageWidget(
                                imagesList:
                                    '$imgaeAppendUrl${state.downloads[0].posterPath}',
                                margin:
                                    const EdgeInsets.only(left: 170, top: 35),
                                angle: 25,
                                size: Size(size.width * 0.4, size.width * 0.58),
                              ),
                              DownloadsImageWidget(
                                imagesList:
                                    '$imgaeAppendUrl${state.downloads[1].posterPath}',
                                margin:
                                    const EdgeInsets.only(right: 170, top: 35),
                                angle: -20,
                                size: Size(size.width * 0.4, size.width * 0.58),
                              ),
                              DownloadsImageWidget(
                                imagesList:
                                    '$imgaeAppendUrl${state.downloads[2].posterPath}',
                                margin:
                                    const EdgeInsets.only(bottom: 30, top: 35),
                                size: Size(size.width * 0.4, size.width * 0.64),
                                radius: 15,
                              ),
                            ],
                          ),
                  )
                : Container();
          },
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kbuttonColorBlue,
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Set up",
                style: TextStyle(
                  color: kwhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        khight,
        MaterialButton(
          color: kwhite,
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "See what you can download",
              style: TextStyle(
                color: backgroundColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({Key? key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.settings,
          color: kwhite,
        ),
        Text(
          "Smart Downloads",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    Key? key,
    required this.imagesList,
    this.angle = 0,
    required this.margin,
    required this.size,
    this.radius = 20,
  });

  final String imagesList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imagesList), fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }
}
