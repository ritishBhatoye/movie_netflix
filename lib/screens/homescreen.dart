import 'package:flutter/material.dart';
import 'dart:async';

import 'package:netflix_clone/models/movie_model.dart';
import 'package:netflix_clone/models/movie_recommendation_mode.dart';
import 'package:netflix_clone/models/popularTVSeries.dart';
import 'package:netflix_clone/models/tv_series_model.dart';
import 'package:netflix_clone/screens/search_screen.dart';
import 'package:netflix_clone/services/api_services.dart';
import 'package:netflix_clone/widgets/continueMovieCard.dart';
import 'package:netflix_clone/widgets/customMovieCarouselSlider.dart';
import 'package:netflix_clone/widgets/custom_carousel.dart';
import 'package:netflix_clone/widgets/popTvShows.dart';
import 'package:netflix_clone/widgets/tvSeriesCard.dart';
import 'package:shimmer/shimmer.dart';

// import 'package:netflix_clone/widgets/upcoming_movie_card_widget.dart';
// import 'package:netflix_clone/widgets/voice_Assistant.dart';
// import 'package:alan_voice/alan_voice.dart';

// import 'package:netflix_clone/widgets/voice_Assistant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   bool _showShimmer = true;
  

  ApiServices apiServices = ApiServices();
  late Future<MovieRecommendationsModel> popularMovies;
  late Future<MovieModel> upcomingFuture;
  late Future<MovieModel> nowPlaying;
  late Future<TvSeriesModel> topRatedShows;
  late Future<PopularTVSeries> popularTVShows;
  late Future<MovieModel> topRatedMovies;

  @override
  void initState() {
    popularMovies = apiServices.getPopularMovies();
    topRatedMovies =apiServices.getTopRatedMovies();
    upcomingFuture = apiServices.getUpcomingMovies();
    nowPlaying = apiServices.getNowPlayingMovies();
    topRatedShows = apiServices.getTopRatedSeries();
    popularTVShows = apiServices.getPopularTVShows();

    super.initState();

      Timer(Duration(seconds: 2), () {
      setState(() {
        _showShimmer = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return 
    
    _showShimmer?
        ListView.builder(
          itemCount: 10, // Assuming you want to display 10 shimmering containers
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Shimmer.fromColors(
                baseColor: Color.fromARGB(129, 0, 0, 0),
                highlightColor:  const Color.fromARGB(194, 158, 158, 158),
                child: Container(
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            );
          },
        )
    : DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
           bottom: TabBar(
            // padding: EdgeInsets.symmetric(),
              dividerColor: Colors.black,
              isScrollable: true,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              labelColor: Colors.black,
              labelStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              unselectedLabelColor: Colors.white,
              tabs: const [
                Tab(
                  text: '   Home   ',
                ),
                Tab(
                  text: "  TV Shows  ",
                ),
                Tab(
                  text: "  Movies  ",
                ),

              ],
            ),
          backgroundColor: Colors.black,
          title: Image.asset(
            'assets/logo.png',
            height: 50,
            width: 120,
          ),
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchScreen(),
                    ),
                  );
                },
                child: const Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: InkWell(
                onTap: () {},
                child: Container(
                  color: Colors.blue,
                  height: 27,
                  width: 27,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        body: TabBarView(


          children: [
            
            //*****HOME********
            SingleChildScrollView(
            child: Column(
              children: [
                FutureBuilder<TvSeriesModel>(
                  future: topRatedShows,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return CustomCarouselSlider(data: snapshot.data!);
                    }
                    return const SizedBox();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 220,
                  child: Continuemoviecard(
                    future: nowPlaying,
                    headlineText: 'Continue watching ',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 220,
                  child: TvSeriescard(
                    future: topRatedShows,
                    headlineText: 'Trending Now',
                  ),
                ),
                 SizedBox(
                  height: 220,
                  child: Poptvshows(
                    future: popularTVShows,
                    headlineText: 'Popular on Netflix',
                  ),
                ),

                // SizedBox(
                //   height: 220,
                //   child: TvSeriesModel(
                //     future: popularTVShows,
                //     headlineText: 'Upcoming Movies',
                //   ),
                // ),

              
              ],
            ),
          ),
         
             //*******TV SHOWS*****
          SingleChildScrollView(
            child: Column(
              children: [
                 FutureBuilder<TvSeriesModel>(
                  future: topRatedShows,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return CustomCarouselSlider(data: snapshot.data!);
                    }
                    return const SizedBox();
                  },
                ),
                
                const SizedBox(
                  height: 20,
                ),
                
                // SizedBox(
                //   height: 220,
                //   child: Continuemoviecard(
                //     future: nowPlaying,
                //     headlineText: 'Continue watching ',
                //   ),
                // ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 220,
                  child: TvSeriescard(
                    future: topRatedShows,
                    headlineText: 'Trending Now',
                  ),
                ),
                 SizedBox(
                  height: 220,
                  child: Poptvshows(
                    future: popularTVShows,
                    headlineText: 'Popular on Netflix',
                  ),
                ),

                // SizedBox(
                //   height: 220,
                //   child: TvSeriesModel(
                //     future: popularTVShows,
                //     headlineText: 'Upcoming Movies',
                //   ),
                // ),
          
              
              ],
            ),
          ),
          //**********MOVIES*********
          SingleChildScrollView(
            child: Column(
              children: [
                FutureBuilder<MovieRecommendationsModel>(
                  future: popularMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return CustomMovieCarouselSlider(data: snapshot.data!);
                    }
                    return const SizedBox();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                // SizedBox(
                //   height: 220,
                //   child: Continuemoviecard(
                //     future: nowPlaying,
                //     headlineText: 'Continue watching ',
                //   ),
                // ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 220,
                  child: TvSeriescard(
                    future: topRatedShows,
                    headlineText: 'Trending Now',
                  ),
                ),
                SizedBox(
                  height: 220,
                  child: Poptvshows(
                    future: popularTVShows,
                    headlineText: 'Popular on Netflix',
                  ),
                ),
                 SizedBox(
                  height: 220,
                  child: Poptvshows(
                    future: popularTVShows,
                    headlineText: 'Popular on Netflix',
                  ),
                ),

                // SizedBox(
                //   height: 220,
                //   child: TvSeriesModel(
                //     future: popularTVShows,
                //     headlineText: 'Upcoming Movies',
                //   ),
                // ),
              //TV SHOWS
              
              ],
            ),
          ),
          ]
        ),
      ),
    );
  }
}
