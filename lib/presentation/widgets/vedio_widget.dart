import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class VedioWidget extends StatelessWidget {
  final String posterPath;
  const VedioWidget({
    super.key,
    required this.posterPath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 225,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10), 
            child: Image.network(
              posterPath,
              fit: BoxFit.fitWidth,
              loadingBuilder: (context, child, loadingProgress) {
                if(loadingProgress==null){
                  return child;
                }else{
                 return Center(child: CircularProgressIndicator(),);
                }
              },
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.wifi);
              },
            ),
          ),
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: CircleAvatar(
            radius: 22,
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
        ),
      ],
    );
  }
}
