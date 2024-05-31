import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/movie_detail_model.dart';
import 'package:netflix_clone/models/movie_model.dart';
import 'package:netflix_clone/models/movie_recommendation_mode.dart';
import 'package:netflix_clone/models/tv_series_model.dart';
import 'package:netflix_clone/screens/movie_detailed_screen.dart';
// import 'package:netflix_clone/screens/streamingPlayer.dart';
import 'package:netflix_clone/services/api_services.dart';
import 'package:netflix_clone/widgets/coming_soon_movie_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone/widgets/comment_review_section/comment_section.dart';
import 'package:shimmer/shimmer.dart';

class DetailBelowSection extends StatefulWidget {
  final int movieId;

  const DetailBelowSection ({super.key, required this.movieId});

  @override
  State<DetailBelowSection > createState() => DetailBelowSectionState();
}

class DetailBelowSectionState extends State<DetailBelowSection > {
   bool _showShimmer = true;

  ApiServices apiServices = ApiServices();

  late Future<MovieDetailModel> movieDetail;
  late Future<MovieRecommendationsModel> movieRecommendationModel;
  
  late Future<TvSeriesModel> topRatedShows;
  late Future<MovieModel> topRatedMovies;

  void initState() {
    fetchInitialData();

    super.initState();
    topRatedShows = apiServices.getTopRatedSeries();
    topRatedMovies = apiServices.getUpcomingMovies();
    
     Timer(Duration(seconds: 2), () {
      setState(() {
        _showShimmer = false;
      });
    });

      
  }
fetchInitialData() {
    movieDetail = apiServices.getMovieDetail(widget.movieId);
    movieRecommendationModel =
        apiServices.getMovieRecommendations(widget.movieId);
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return _showShimmer ?
                      SingleChildScrollView(
                    child: FutureBuilder(
                      future: movieRecommendationModel,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final movie = snapshot.data;
                    
                          return movie!.results.isEmpty
                              ? const SizedBox()
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // const Text(
                                    //   "More like this",
                                    //   maxLines: 6,
                                    //   overflow: TextOverflow.ellipsis,
                                    //   style: TextStyle(
                                    //     color: Colors.white,
                                    //     fontWeight: FontWeight.bold,
                                    //   ),
                                    // ),
                                    // const SizedBox(height: 20),
                                    GridView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      itemCount: movie.results.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        mainAxisSpacing: 15,
                                        childAspectRatio: 1.5 / 2,
                                      ),
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    MovieDetailScreen(
                                                        movieId: movie
                                                            .results[index].id),
                                              ),
                                            );
                                          },
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                "$imageUrl${movie.results[index].posterPath}",
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                );
                        }
                        return const Text("Something Went wrong");
                      },
                    ),
                  )
    : DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          // title: const Text(
          //   'New & Hot',
          //   style: TextStyle(color: Colors.white),
          // ),
          automaticallyImplyLeading: false,
          actions: [
            // const Padding(
            //   padding: EdgeInsets.only(right: 10.0),
            //   child: Icon(
            //     Icons.cast,
            //     color: Colors.white,
            //   ),
            // ),
            // const SizedBox(
            //   width: 10,
            // ),
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(6),
            //   child: Container(
            //     color: Colors.blue,
            //     height: 27,
            //     width: 28,
            //   ),
            // ),
            // const SizedBox(
            //   width: 20,
            // ),
          ],
          bottom: TabBar(
            dividerColor: Colors.black,
            isScrollable: true,
            indicator:
             BoxDecoration(
              // borderRadius: BorderRadius.circular(20),
              // color: Colors.white,
              border: Border(
                top: BorderSide(color: Colors.red,
                width: 1)
              )
            ),
            labelColor: Colors.white,
            labelStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            unselectedLabelColor: Colors.white,
            tabs: const [
              Tab(
                text: ' More Like This ',
              ),
              Tab(
                text: " Review ",
              ),
              // Tab(
              //   text: " 🔝 Top 10 TV Show",
              // ),
              // Tab(
              //   text: " 💯 Top 10 Movies",
              // )
            ],
          ),
        ),
        body: TabBarView(
          children: [
                            
                SingleChildScrollView(
                  child: FutureBuilder(
                    future: movieRecommendationModel,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final movie = snapshot.data;
                  
                        return movie!.results.isEmpty
                            ? const SizedBox()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // const Text(
                                  //   "More like this",
                                  //   maxLines: 6,
                                  //   overflow: TextOverflow.ellipsis,
                                  //   style: TextStyle(
                                  //     color: Colors.white,
                                  //     fontWeight: FontWeight.bold,
                                  //   ),
                                  // ),
                                  // const SizedBox(height: 20),
                                  GridView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.vertical,
                                    itemCount: movie.results.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 15,
                                      childAspectRatio: 1.5 / 2,
                                    ),
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  MovieDetailScreen(
                                                      movieId: movie
                                                          .results[index].id),
                                            ),
                                          );
                                        },
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              "$imageUrl${movie.results[index].posterPath}",
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                      }
                      return const Text("Something Went wrong");
                    },
                  ),
                ),
                  SingleChildScrollView(
                                child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:BorderRadius.circular(120) 
                                                    ),
                                                    margin: EdgeInsets.only(bottom: 60),
                                                    child: SizedBox(
                                                      width: MediaQuery.sizeOf(context).width*0.9,
                                                      height: MediaQuery.sizeOf(context).height*0.9,
                                                    
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(20),
                                                        child: CommentPage())),
                                                  ),
                              ),
      
         
            // Add Tab content for Top 10 Movies
          ],
        ),
      ),
    );
  }
}
