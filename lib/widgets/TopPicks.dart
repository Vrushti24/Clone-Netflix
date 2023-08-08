import 'package:demos/pages/MovieDetails.dart';
import 'package:flutter/material.dart';
import 'package:demos/constants.dart';

class TopPicks extends StatelessWidget {
  const TopPicks({
    super.key,
    required this.snapshot,
  });
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 0, right: 200),
          child: Text(
            'Top picks for V',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 300,
          width: double.infinity,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MovieDetails(movie: snapshot.data[index])));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: SizedBox(
                          width: 200,
                          height: 200,
                          child: Image.network(
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                            '${constants.imagePath}${snapshot.data![index].posterPath}',
                          )),
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
