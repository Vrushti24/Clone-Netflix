import 'package:carousel_slider/carousel_slider.dart';
import 'package:demos/pages/MovieDetails.dart';
import 'package:flutter/material.dart';
import 'package:demos/constants.dart';

class SlideShow extends StatelessWidget {
  const SlideShow({
    super.key,
    required this.snapshot,
  });
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: snapshot.data.length,
        options: CarouselOptions(
            height: 250,
            autoPlay: true,
            enlargeCenterPage: true,
            pageSnapping: true,
            viewportFraction: 0.60,
            autoPlayCurve: Curves.linear,
            autoPlayAnimationDuration: const Duration(seconds: 1)),
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MovieDetails(movie: snapshot.data[itemIndex])));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                  width: 200,
                  height: 500,
                  child: Image.network(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    '${constants.imagePath}${snapshot.data[itemIndex].posterPath}',
                  )),
            ),
          );
        },
      ),
    );
  }
}
