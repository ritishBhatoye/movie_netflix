import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/movie_detail_model.dart';
import 'package:netflix_clone/models/movie_recommendation_mode.dart';
import 'package:netflix_clone/screens/movie_detailed_screen.dart';
import 'package:netflix_clone/services/api_services.dart';

class More_N_Trailer extends StatefulWidget {
  final int movieId;
  const More_N_Trailer({super.key, required this.movieId});

  @override
  _More_N_TrailerState createState() => _More_N_TrailerState();
}

class _More_N_TrailerState extends State<More_N_Trailer>
    with SingleTickerProviderStateMixin {
  ApiServices apiServices = ApiServices();

  late Future<MovieDetailModel> movieDetail;
  late Future<MovieRecommendationsModel> movieRecommendationModel;
  late TabController _tabController;

  @override
  void initState() {
    fetchInitialData();
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  fetchInitialData() {
    movieDetail = apiServices.getMovieDetail(widget.movieId);
    movieRecommendationModel =
        apiServices.getMovieRecommendations(widget.movieId);
    setState(() {});
  }

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar Demo'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Tab 1'),
            Tab(text: 'Tab 2'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
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
                            const Text(
                              "More like this",
                              maxLines: 6,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
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
                                        builder: (context) => MovieDetailScreen(
                                            movieId: movie.results[index].id),
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
          Center(child: Text('Tab 2 Content')),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
