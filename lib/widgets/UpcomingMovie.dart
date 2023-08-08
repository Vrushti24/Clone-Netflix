import 'package:demos/pages/MovieDetails.dart';
import 'package:flutter/material.dart';
import 'package:demos/constants.dart';

class UpcomingMovie extends StatelessWidget {
  const UpcomingMovie({
    super.key,
    required this.snapshot,
  });
  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 0, right: 200),
            child: Text(
              'Upcoming Movies',
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
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MovieDetails(movie: snapshot.data[index])));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
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
          ),
        ],
      ),
    );
  }
}
