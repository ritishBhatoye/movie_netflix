import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone/widgets/movieList.dart';
import 'package:netflix_clone/widgets/wishListManager.dart';
// import 'package:netflix_clone/movie_list_provider.dart';
import 'dart:async';
import 'package:shimmer/shimmer.dart';  
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/models/movie_detail_model.dart';
import 'package:netflix_clone/models/movie_recommendation_mode.dart';
import 'package:netflix_clone/screens/lastSectionOfMovieDetailed.dart';
import 'package:netflix_clone/screens/player/PlayerScreen.dart';
import 'package:netflix_clone/screens/player/video.dart';
import 'package:netflix_clone/screens/streamingPlayer.dart';
import 'package:netflix_clone/services/api_services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/movie_detail_model.dart';
import 'package:netflix_clone/models/movie_recommendation_mode.dart';
import 'package:netflix_clone/screens/movie_detailed_screen.dart';
import 'package:netflix_clone/services/api_services.dart';
import 'package:netflix_clone/widgets/comment_review_section/comment_section.dart';
import 'package:netflix_clone/widgets/movieListProvider.dart';
import 'package:provider/provider.dart';

class TvDetailedScreen extends StatefulWidget {
  final int movieId;
  final String name;
  final DateTime year;
  // final String genre;
  final String overview;
  final String imgUrl;
  const TvDetailedScreen ({super.key, 
  required this.movieId,
  required this.name,
  required this.year,
  // required this.genre,
  required this.overview,
  required this.imgUrl});

  @override
  TvDetailedScreenState createState() => TvDetailedScreenState();
}

class TvDetailedScreenState extends State<TvDetailedScreen > {
  final WishlistManager _wishlistManager = WishlistManager();
  bool _isInWishlist = false;
   bool _showShimmer = true;
   bool _showTeaser = true;
   late VideoPlayerController _controller;

  ApiServices apiServices = ApiServices();

  late Future<MovieDetailModel> movieDetail;
  late Future<MovieRecommendationsModel> movieRecommendationModel;
  late TabController _tabController;
  late List<Movie> myList = []; 



  
  void initState() {
    print("Movie id: ${widget.movieId}");
    fetchInitialData();
    super.initState();
    // _tabController = TabController(length: 2, vsync: this);

       Timer(Duration(seconds: 2), () {
      setState(() {
        _showShimmer = false;
      });
    });
    Timer(Duration(seconds: 5), () {
      setState(() {
         _showTeaser = false;
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
    var size = MediaQuery.of(context).size;
    print(widget.movieId);
    return 
    
    _showShimmer?Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Shimmer.fromColors(
                baseColor: Color.fromARGB(129, 0, 0, 0),
                highlightColor:  const Color.fromARGB(194, 158, 158, 158),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: 30,),
                  
                      Container(
                        height: 250.0,
                        width: MediaQuery.sizeOf(context).width*0.8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      SizedBox(height: 1,),
                      Container(
                        height: 30.0,
                        width: MediaQuery.sizeOf(context).width*0.8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      SizedBox(height: 1,),
                      Container(
                        height: 50.0,
                        width: MediaQuery.sizeOf(context).width*0.8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      SizedBox(height: 1,),
                  
                        Container(
                        height: 200.0,
                        width: MediaQuery.sizeOf(context).width*0.8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
         
    : Scaffold(
      // appBar: AppBar(
      //   bottom: TabBar(
      //     controller: _tabController,
      //     tabs: [
      //       Tab(text: 'Tab 1'),
      //       Tab(text: 'Tab 2'),
      //     ],
      //   ),
      // ),
      body: SingleChildScrollView(
        child:Column(
                children: [
                  
                  Stack(
                    children: [
                      Container(
                        height: size.height * 0.4,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    widget.imgUrl),
                                fit: BoxFit.cover)),
                        child: SafeArea(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.arrow_back_ios,
                                    color: Colors.white),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 25, left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
//                             Text(
//   '${(movie.popularity.clamp(0, 1) * 100).toStringAsFixed(2)}%', // Convert to percentage format
//   style: const TextStyle(
//     color: Colors.grey,
//     fontSize: 17,
//   ),
// ),

                            Text(
                              widget.year.year.toString(),
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.2,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: 60,
                                    child:Image(
                                            image: AssetImage(
                                            'assets/ua.jpg',
                                          )) 
                                    // movie.adult
                                    //     ? Image(
                                    //         image: AssetImage(
                                    //         'assets/a.png',
                                    //       ))
                                    //     : Image(
                                    //         image: AssetImage('assets/ua.jpg')),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 1,
                            ),
                            // Text(
                            //   genresText,
                            //   style: const TextStyle(
                            //     color: Colors.grey,
                            //     fontSize: 16,
                            //   ),
                            // ),
                          ],
                        ),
                        const SizedBox(height: 5),

                           Text(
                              "genresText",
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                              ),
                            ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Container(
                              width: MediaQuery.sizeOf(context).width * 1,
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: Color(0xFFE6E6E6),
                                      foregroundColor: Colors.black,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.all(Radius.zero))),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 22,
                                        child: Image(
                                            image:
                                                AssetImage("assets/play.png")),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Play",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15.5),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SearchFilterScreen(mTitle:  widget.name ,)),
                                    );
                                  }),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 1,
                              // height: 46,
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: Color(0xff323232),
                                      foregroundColor: Color(0xFFE6E6E6),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.all(Radius.zero))),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 22,
                                        child: Image(
                                          image: AssetImage(
                                              "assets/profile/download.png"),
                                          color: Color(0xFFE6E6E6),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Download",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.5),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {}),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          widget.overview,
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: 
                                        () {
  // MovieListPersonalised movieListPersonalised = MovieListPersonalised(
  //   id: movie.id,
  //   title: movie.title,
  //   posterPath: movie.posterPath,
  //   overview: movie.overview,
  //   adult: movie.adult,
  //   releaseDate: "${formatDate(movie.releaseDate)}",
  //   // genres: movie.genres.map((genre) => Genre(id: genre.id, name: genre.name)).toList(),
  // );

  // if (_isInWishlist) {
  //   _wishlistManager.removeFromWishlist(movieListPersonalised);
  // } else {
  //   _wishlistManager.addToWishlist(movieListPersonalised);
  // }

  // setState(() {
  //   _isInWishlist = !_isInWishlist;

  // });
},
//                     onTap: () 
//                     {
//   if (_isInWishlist) {
//     _wishlistManager.removeFromWishlist(
//       MovieListPersonalised(
//         id: movie.id,
//         title: movie.title,
//         posterPath: movie.posterPath,
//         overview: movie.overview,
//         adult: movie.adult,
//         releaseDate: "${formatDate(movie.releaseDate)}",
//         genres: movie.genres,
//       ),
//     );
//   } else {
//     _wishlistManager.addToWishlist(
//       MovieListPersonalised(
//         id: movie.id,
//         title: movie.title,
//         posterPath: movie.posterPath,
//         overview: movie.overview,
//         adult: movie.adult,
//         releaseDate: "${formatDate(movie.releaseDate)}",
//         genres: movie.genres,
//       ),
//     );
//   }

//   setState(() {
//     _isInWishlist = !_isInWishlist;
//   });
// },
                    child: Image(
                      width: 35,
                      image: AssetImage("assets/plus.png"),
                      color: _isInWishlist
                          ? Colors.white
                          : Color(0xFFE6E6E6), // Change color based on wishlist status
                    ),
                  ),
//                                       InkWell(
// // onTap: (){},
//                                         onTap: (){
//                                           setState(() {
//                                             movie.video=true;
//                                             // print
//                                           });
//                                         },
//                                         onTap: () {
//   final movieProvider = Provider.of<MovieListProvider>(
//     context,
//     listen: false,
//   );
//   movieProvider.addToMyList(
//     MovieList(
//       dates: Dates(
//         maximum: DateTime.now(), // Provide appropriate values
//         minimum: DateTime.now(), // Provide appropriate values
//       ),
//       page: 1, // Provide appropriate value
//       results: [Results()], // Provide appropriate values
//       totalPages: 1, // Provide appropriate value
//       totalResults: 1, // Provide appropriate value
//     ),
//   );
// },

                    //                     onTap: () {
                    //   final movieProvider = Provider.of<MovieListProvider>(
                    //     context,
                    //     listen: false,
                    //   );
                    //   movieProvider.addToMyList(
                    //     MovieList(


                    //     ),
                    //   );
                    // },
                            //              onTap: () {
                            //   addToMyList(movie.id); // Add movie to "My List"
                            // },
                                      //   child: Image(
                                      //     width: 35,
                                      //     image: AssetImage("assets/plus.png"),
                                      //     color: Color(0xFFE6E6E6),
                                      //   ),
                                      // ),
                                      InkWell(
                                        onTap: () {
                                          // print("Image: $imageUrl${movie.posterPath}");
                                          // print("Name: ${movie.title}");
                                        },
                                        child: Text(
                                          "My List",
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Image(
                                        width: 35,
                                        image:
                                            AssetImage("assets/likeLight.png"),
                                        color: Color(0xFFE6E6E6),
                                      ),
                                      Text(
                                        "Rate",
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Image(
                                        width: 35,
                                        image: AssetImage("assets/share.png"),
                                        color: Color(0xFFE6E6E6),
                                      ),
                                      Text(
                                        "Recommended",
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
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
                  )
                  // FutureBuilder(
                  //   future: movieRecommendationModel,
                  //   builder: (context, snapshot) {
                  //     if (snapshot.hasData) {
                  //       final movie = snapshot.data;

                  //       return movie!.results.isEmpty
                  //           ? const SizedBox()
                  //           : Column(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 const Text(
                  //                   "More like this",
                  //                   maxLines: 6,
                  //                   overflow: TextOverflow.ellipsis,
                  //                   style: TextStyle(
                  //                     color: Colors.white,
                  //                     fontWeight: FontWeight.bold,
                  //                   ),
                  //                 ),
                  //                 const SizedBox(height: 20),
                  //                 GridView.builder(
                  //                   physics:
                  //                       const NeverScrollableScrollPhysics(),
                  //                   shrinkWrap: true,
                  //                   padding: EdgeInsets.zero,
                  //                   scrollDirection: Axis.vertical,
                  //                   itemCount: movie.results.length,
                  //                   gridDelegate:
                  //                       const SliverGridDelegateWithFixedCrossAxisCount(
                  //                     crossAxisCount: 3,
                  //                     mainAxisSpacing: 15,
                  //                     childAspectRatio: 1.5 / 2,
                  //                   ),
                  //                   itemBuilder: (context, index) {
                  //                     return InkWell(
                  //                       onTap: () {
                  //                         Navigator.push(
                  //                           context,
                  //                           MaterialPageRoute(
                  //                             builder: (context) =>
                  //                                 MovieDetailScreen(
                  //                                     movieId: movie
                  //                                         .results[index].id),
                  //                           ),
                  //                         );
                  //                       },
                  //                       child: CachedNetworkImage(
                  //                         imageUrl:
                  //                             "$imageUrl${movie.results[index].posterPath}",
                  //                       ),
                  //                     );
                  //                   },
                  //                 ),
                  //               ],
                  //             );
                  //     }
                  //     return const Text("Something Went wrong");
                  //   },
                  // ),
                ],
              ),
           
      ),
    );
  }
    String formatDate(DateTime date) {
    // Format date using DateFormat
    return DateFormat('MMMM d, y').format(date);
  }
}


                  // Container(
                  //     height: MediaQuery.sizeOf(context).height,
                  //     width: MediaQuery.sizeOf(context).width,
                  //     child: More_N_Trailer(movieId:data[index].id,))