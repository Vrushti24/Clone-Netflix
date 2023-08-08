import 'package:demos/models/Movie.dart';
import 'package:demos/service/apiService.dart';
import 'package:demos/widgets/UpcomingMovie.dart';
import 'package:demos/widgets/SlideShow.dart';
import 'package:demos/widgets/TopPicks.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> upcomingMovies;

  @override
  void initState() {
    super.initState();
    trendingMovies = apiService().getTrendingMovies();
    topRatedMovies = apiService().getTopRatedMovies();
    upcomingMovies = apiService().getUpcomingMovie();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: Image.asset(
          'icons/logo.jpeg',
        ),
        leadingWidth: 80,
        actions: [
          MaterialButton(
            onPressed: () {},
            child: Text(
              'TV Shows',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {},
            child: Text(
              'Movies',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {},
            child: Text(
              'Categories',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //slideshow trending
            SizedBox(
              child: FutureBuilder(
                  future: trendingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return SlideShow(
                        snapshot: snapshot,
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
            //top picks for V
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              child: FutureBuilder(
                  future: trendingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return TopPicks(
                        snapshot: snapshot,
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),

            //upcoming
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              child: FutureBuilder(
                  future: upcomingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return UpcomingMovie(
                        snapshot: snapshot,
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
            const SizedBox(
              height: 15,
            ),
            // Romantic(),
          ],
        ),
      ),
    );
  }
}
