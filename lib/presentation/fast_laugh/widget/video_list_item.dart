import 'package:flutter/material.dart';
import 'package:netflix_clone/application/fast_laugh/bloc/fast_laugh_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/colors/constants.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class VedioListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;

  const VedioListItemInheritedWidget(
      {super.key, required this.widget, required this.movieData})
      : super(child: widget);

  @override
  bool updateShouldNotify(covariant VedioListItemInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VedioListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VedioListItemInheritedWidget>();
  }
}

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final posterPath =
        VedioListItemInheritedWidget.of(context)?.movieData.posterPath;
    final videoUrls = dummyVideoUrls[index % dummyVideoUrls.length];
    return Stack(
      children: [
        FastLaughvedioPlayer(vedioUrl: videoUrls, onStateChanged: (bool) {}),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_off,
                      size: 30,
                      color: kwhite,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: CircleAvatar(
                          backgroundImage: posterPath == null
                              ? null
                              : NetworkImage("$imgaeAppendUrl$posterPath"),
                          radius: 25,
                        ),
                      ),
                      khight,
                      const VedioActionsWidget(
                          icon: Icons.emoji_emotions, titile: "Lol"),
                      VedioActionsWidget(icon: Icons.add, titile: "My List"),
                      GestureDetector(
                          onTap: () {
                            final movieNAme =
                                VedioListItemInheritedWidget.of(context)
                                    ?.movieData
                                    .posterPath;
                            if (movieNAme != null) {
                              Share.share(movieNAme);
                            }
                          },
                          child: VedioActionsWidget(
                              icon: Icons.share, titile: "Share")),
                      VedioActionsWidget(icon: Icons.play_arrow, titile: "Play")
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VedioActionsWidget extends StatelessWidget {
  final IconData icon;
  final String titile;
  const VedioActionsWidget({
    super.key,
    required this.icon,
    required this.titile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
        Text(
          titile,
          style: const TextStyle(color: kwhite, fontSize: 16),
        ),
        khight
      ],
    );
  }
}

class FastLaughvedioPlayer extends StatefulWidget {
  final String vedioUrl;
  final void Function(bool isPlaying) onStateChanged;
  const FastLaughvedioPlayer(
      {super.key, required this.vedioUrl, required this.onStateChanged});

  @override
  State<FastLaughvedioPlayer> createState() => _FastLaughvedioPlayerState();
}

class _FastLaughvedioPlayerState extends State<FastLaughvedioPlayer> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    // ignore: deprecated_member_use
    _videoPlayerController = VideoPlayerController.network(widget.vedioUrl);
    _videoPlayerController.initialize().then((value) {
      setState(() {
        _videoPlayerController.play();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: _videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
