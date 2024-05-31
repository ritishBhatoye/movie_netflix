import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/movie_model.dart';
import 'package:netflix_clone/models/tv_series_model.dart';
import 'package:netflix_clone/services/api_services.dart';
import 'package:netflix_clone/widgets/coming_soon_movie_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
   bool _showShimmer = true;

  ApiServices apiServices = ApiServices();

  late Future<TvSeriesModel> topRatedShows;
  late Future<MovieModel> topRatedMovies;

  @override
  void initState() {
    super.initState();
    topRatedShows = apiServices.getTopRatedSeries();
    topRatedMovies = apiServices.getUpcomingMovies();

     Timer(Duration(seconds: 2), () {
      setState(() {
        _showShimmer = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _showShimmer ?
    ListView.builder(
          itemCount: 10, // Assuming you want to display 10 shimmering containers
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Shimmer.fromColors(
                baseColor: Color.fromARGB(129, 0, 0, 0),
                highlightColor:  const Color.fromARGB(194, 158, 158, 158),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width*0.16,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
SizedBox(width: 10,),
                    Container(
                      height: 150.0,
                      width: MediaQuery.sizeOf(context).width*0.7,

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )
    //  Shimmer.fromColors(
    //           baseColor: Color.fromARGB(129, 0, 0, 0),
    //           highlightColor: const Color.fromARGB(194, 158, 158, 158),
    //           child: ListTile(
    //             leading: Container(
    //               width: 56.0,
    //               height: 56.0,
    //               color: Colors.white,
    //             ),
    //             title: Container(
    //               height: 16.0,
    //               color: Colors.white,
    //             ),
    //             subtitle: Container(
    //               height: 16.0,
    //               color: Colors.white,
    //             ),
    //           ),
    //         )

    
    // Shimmer.fromColors(
    //         baseColor: Colors.grey[300]!,
    //         highlightColor: Colors.grey[100]!,
    //         period: Duration(milliseconds: 1500),
    //         child:
    //         DefaultTabController(
    //   length: 4,
    //   child: SafeArea(
    //     child: Scaffold(
    //       appBar: AppBar(
    //         elevation: 0,
    //         backgroundColor: Colors.black,
    //         title: const Text(
    //           'New & Hot',
    //           style: TextStyle(color: Colors.white),
    //         ),
    //         actions: [
    //           const Padding(
    //             padding: EdgeInsets.only(right: 10.0),
    //             child: Icon(
    //               Icons.cast,
    //               color: Colors.white,
    //             ),
    //           ),
    //           const SizedBox(
    //             width: 10,
    //           ),
    //           ClipRRect(
    //             borderRadius: BorderRadius.circular(6),
    //             child: Container(
    //               color: Colors.blue,
    //               height: 27,
    //               width: 28,
    //             ),
    //           ),
    //           const SizedBox(
    //             width: 20,
    //           ),
    //         ],
    //         bottom: TabBar(
    //           dividerColor: Colors.black,
    //           isScrollable: true,
    //           indicator: BoxDecoration(
    //             borderRadius: BorderRadius.circular(20),
    //             color: Colors.white,
    //           ),
    //           labelColor: Colors.black,
    //           labelStyle:
    //               const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
    //           unselectedLabelColor: Colors.white,
    //           tabs: const [
    //             Tab(
    //               text: '  🍿 Coming Soon  ',
    //             ),
    //             Tab(
    //               text: "  🔥 Everyone's watching  ",
    //             ),
    //             Tab(
    //               text: " 🔝 Top 10 TV Show",
    //             ),
    //             Tab(
    //               text: " 💯 Top 10 Movies",
    //             )
    //           ],
    //         ),
    //       ),
    //       body: TabBarView(
    //         children: [
    //           SingleChildScrollView(
    //             child: Column(
    //               children: [
    //                 ComingSoonMovieWidget(
    //                   imageUrl:
    //                       'https://miro.medium.com/v2/resize:fit:1024/1*P_YU8dGinbCy6GHlgq5OQA.jpeg',
    //                   overview:
    //                       'When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces, and one strange little girl.',
    //                   logoUrl:
    //                       "https://s3.amazonaws.com/www-inside-design/uploads/2017/10/strangerthings_feature-983x740.jpg",
    //                   month: "Jun",
    //                   day: "19",
    //                 ),
    //                 SizedBox(
    //                   height: 20,
    //                 ),
    //                 ComingSoonMovieWidget(
    //                   imageUrl:
    //                       'https://www.pinkvilla.com/images/2022-09/rrr-review.jpg',
    //                   overview:
    //                       'A fearless revolutionary and an officer in the British force, who once shared a deep bond, decide to join forces and chart out an inspirational path of freedom against the despotic rulers.',
    //                   logoUrl:
    //                       "https://www.careerguide.com/career/wp-content/uploads/2023/10/RRR_full_form-1024x576.jpg",
    //                   month: "Mar",
    //                   day: "07",
    //                 ),
    //               ],
    //             ),
    //           ),
    //           ComingSoonMovieWidget(
    //             imageUrl:
    //                 'https://miro.medium.com/v2/resize:fit:1024/1*P_YU8dGinbCy6GHlgq5OQA.jpeg',
    //             overview:
    //                 'When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces, and one strange little girl.',
    //             logoUrl:
    //                 "https://logowik.com/content/uploads/images/stranger-things4286.jpg",
    //             month: "Feb",
    //             day: "20",
    //           ),
    //           FutureBuilder<TvSeriesModel>(
    //             future: topRatedShows,
    //             builder: (context, snapshot) {
    //               if (snapshot.hasData) {
    //                 var data = snapshot.data!.results;
    //                 return Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Expanded(
    //                       child: ListView.builder(
    //                         shrinkWrap: true,
    //                         scrollDirection: Axis.vertical,
    //                         itemCount: data!.length,
    //                         itemBuilder: (context, index) {
    //                           DateTime releaseDate = data[index].firstAirDate;
    //                           String monthName =
    //                               DateFormat('MMMM').format(releaseDate);
    //                           return SingleChildScrollView(
    //                             child: Column(
    //                               children: [
    //                                 ComingSoonMovieWidget(
    //                                   imageUrl:
    //                                       '$imageUrl${data[index].posterPath}',
    //                                   overview: '${data[index].overview}',
    //                                   logoUrl:
    //                                       '$imageUrl${data[index].backdropPath}',
    //                                   month: '${monthName}',
    //                                   day: '${data[index].firstAirDate.day}',
    //                                 ),
    //                               ],
    //                             ),
    //                           );
    //                         },
    //                       ),
    //                     ),
    //                   ],
    //                 );
    //               } else {
    //                 return const Center(
    //                   child: CircularProgressIndicator(),
    //                 );
    //               }
    //             },
    //           ),
    //           FutureBuilder<MovieModel>(
    //               future: topRatedMovies,
    //               builder: (context, snapshot) {
    //                 if (snapshot.hasData) {
    //                   var data = snapshot.data?.results;
    //                   return Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       Expanded(
    //                           child: ListView.builder(
    //                               shrinkWrap: true,
    //                               scrollDirection: Axis.vertical,
    //                               itemBuilder: (context, index) {
    //                                 DateTime releaseDate =
    //                                     data![index].releaseDate;
    //                                 String monthName =
    //                                     DateFormat('MMMM').format(releaseDate);
    //                                 return SingleChildScrollView(
    //                                   child: Column(
    //                                     children: [
    //                                       ComingSoonMovieWidget(
    //                                           imageUrl:
    //                                               '$imageUrl${data![index].posterPath}',
    //                                           overview:
    //                                               '${data[index].overview}',
    //                                           logoUrl:
    //                                               '$imageUrl${data![index].backdropPath}',
    //                                           month: '${monthName}',
    //                                           day:
    //                                               '${data[index].releaseDate.day}')
    //                                     ],
    //                                   ),
    //                                 );
    //                               }))
    //                     ],
    //                   );
    //                 } else {
    //                   return const SizedBox.shrink();
    //                 }
    //               })
    //           // Add Tab content for Top 10 Movies
    //         ],
    //       ),
    //     ),
    //   ),
    // )
    //         // Column(
    //         //   mainAxisAlignment: MainAxisAlignment.center,
    //         //   children: [
    //         //     Container(
    //         //       width: 200.0,
    //         //       height: 200.0,
    //         //       color: Colors.white,
    //         //     ),
    //         //     SizedBox(height: 20.0),
    //         //     Container(
    //         //       width: 150.0,
    //         //       height: 20.0,
    //         //       color: Colors.white,
    //         //     ),
    //         //     SizedBox(height: 20.0),
    //         //     Container(
    //         //       width: 100.0,
    //         //       height: 20.0,
    //         //       color: Colors.white,
    //         //     ),
    //         //   ],
    //         // ),
    //       )
    : DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.black,
            title: const Text(
              'New & Hot',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              const Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Icon(
                  Icons.cast,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Container(
                  color: Colors.blue,
                  height: 27,
                  width: 28,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
            bottom: TabBar(
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
                  text: '  🍿 Coming Soon  ',
                ),
                Tab(
                  text: "  🔥 Everyone's watching  ",
                ),
                Tab(
                  text: " 🔝 Top 10 TV Show",
                ),
                Tab(
                  text: " 💯 Top 10 Movies",
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    ComingSoonMovieWidget(
                      imageUrl:
                          'https://image.tmdb.org/t/p/original/6LWtSm2VHfenFBMvmjG9GYgfvSd.jpg',
                      overview:
                          'Comedian Kapil Sharma hosts this laugh-out-loud variety talk show with celebrity guests, hilarious antics and his signature supporting cast.',
                      logoUrl:
                          "https://image.tmdb.org/t/p/original/ulJpJulH2l9OKopOKZuWmZXKDhW.png",
                      month: "April",
                      day: "13",
                    ),
                     SizedBox(
                      height: 20,
                    ),
                       ComingSoonMovieWidget(
                      imageUrl:
                          'https://image.tmdb.org/t/p/original/aButBgUMFxnduH3TyUSPGhTKW75.jpg',
                      overview:
                          'A humble singer’s brash lyrics ignite fame and fury across Punjab as he grapples with soaring success and brutal criticism before his untimely death.',
                      logoUrl:
                          "https://image.tmdb.org/t/p/original/rB7xitKUZVNBvRuaBeCgGwCHlnt.png",
                      month: "April",
                      day: "12",
                    ),
                     SizedBox(
                      height: 20,
                    ),
                    ComingSoonMovieWidget(
                      imageUrl:
                          'https://image.tmdb.org/t/p/original/1l7vsAIkqOzrqiPwjO27Cb5QdfJ.jpg',
                      overview:
                          "A locally born and bred S.W.A.T. lieutenant is torn between loyalty to the streets and duty to his fellow officers when he's tasked to run a highly-trained unit that's the last stop for solving crimes in Los Angeles.",
                      logoUrl:
                          "https://image.tmdb.org/t/p/original/uBxIeTKeYhtdI8TtWYqIrAgFvSt.png",
                      month: "April",
                      day: "13",
                    ),
                     SizedBox(
                      height: 20,
                    ),
                    ComingSoonMovieWidget(
                      imageUrl:
                          'https://image.tmdb.org/t/p/original/6faYaQyiBPhqAizldJKq21mIVaE.jpg',
                      overview:
                          "The Spengler family returns to where it all started – the iconic New York City firehouse – to team up with the original Ghostbusters, who've developed a top-secret research lab to take busting ghosts to the next level. But when the discovery of an ancient artifact unleashes an evil force, Ghostbusters new and old must join forces to protect their home and save the world from a second Ice Age.",
                      logoUrl:
                          "https://image.tmdb.org/t/p/original/mDHQSxfY097KjDHJAd4sFAJsKrQ.png",
                      month: "April",
                      day: "19",
                    ),
                     SizedBox(
                      height: 20,
                    ),
                       ComingSoonMovieWidget(
                      imageUrl:
                          'https://image.tmdb.org/t/p/original/yu7DvTjy2FmxYv3MLIaz7COeRx.jpg',
                      overview:
                          "We don't have an overview translated in English. Help us expand our database by adding one.",
                      logoUrl:
                          "https://image.tmdb.org/t/p/original/pvkHYGsV9IZLgQbfcG776YFARB0.png",
                      month: "April",
                      day: "19",
                    ),
                     SizedBox(
                      height: 20,
                    ),
                      ComingSoonMovieWidget(
                      imageUrl:
                          'https://image.tmdb.org/t/p/original/kwJ91wfllDsXF3yi9Cvf57uQTNM.jpg',
                      overview:
                          "When police officer Nikki Batista’s son goes missing, she joins the Philadelphia Police Department's Missing Person’s Unit (MPU) to help other people find their loved ones, even as she searches for her own. Six years later, her world is turned upside-down when her ex-husband, Jason Grant, a former police officer, shows up with a proof-of-life photo of their missing boy. Or is it?",
                      logoUrl:
                          "https://image.tmdb.org/t/p/original/frNjiKFz7loAwu4BnL3oQQWIWo0.png",
                      month: "April",
                      day: "19",
                    ),
                     SizedBox(
                      height: 20,
                    ),
                      ComingSoonMovieWidget(
                      imageUrl:
                          'https://image.tmdb.org/t/p/original/r4a3cO9Cc6GTLMeUR48gVqMb6jK.jpg',
                      overview:
                          'The rebels gear up for battle against the Motherworld as unbreakable bonds are forged, heroes emerge — and legends are made.',
                      logoUrl:
                          "https://image.tmdb.org/t/p/original/fWD6jigkEwPQ8zjMeQg7tsK9Vvi.png",
                      month: "April",
                      day: "19",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                     ComingSoonMovieWidget(
                      imageUrl:
                          'https://image.tmdb.org/t/p/original/9cqNxx0GxF0bflZmeSMuL5tnGzr.jpg',
                      overview:
                          'Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.',
                      logoUrl:
                          "https://image.tmdb.org/t/p/original/8pPq3gJG4oWYonbL6DaHslJeCaM.png",
                      month: "May",
                      day: "02",
                    ),
                   
                      SizedBox(
                      height: 20,
                    ),
                    ComingSoonMovieWidget(
                      imageUrl:
                          'https://image.tmdb.org/t/p/original/onmSVwYsPMYtO8OjLdjS8FfRNKb.jpg',
                      overview:
                          "In the criminal justice system, sexually-based offenses are considered especially heinous. In New York City, the dedicated detectives who investigate these vicious felonies are members of an elite squad known as the Special Victims Unit. These are their stories.",
                      logoUrl:
                          "https://image.tmdb.org/t/p/original/AhtQAQVcqWl6b0UZSo9vmHE3skK.png",
                      month: "May",
                      day: "02",
                    ),
                     SizedBox(
                      height: 20,
                    ),
                    ComingSoonMovieWidget(
                      imageUrl:
                          'https://image.tmdb.org/t/p/original/7zkZaGIaDUcNl7n5vCXodIyRnRV.jpg',
                      overview:
                          'Facing relentless foes and sudden bankruptcy, an Atlanta real estate tycoon must claw his way back to the top when his empire begins to crumble.',
                      logoUrl:
                          "https://pics.filmaffinity.com/a_man_in_full-351126821-large.jpg",
                      month: "May",
                      day: "02",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ComingSoonMovieWidget(
                      imageUrl:
                          'https://www.pinkvilla.com/images/2022-09/rrr-review.jpg',
                      overview:
                          'A fearless revolutionary and an officer in the British force, who once shared a deep bond, decide to join forces and chart out an inspirational path of freedom against the despotic rulers.',
                      logoUrl:
                          "https://www.careerguide.com/career/wp-content/uploads/2023/10/RRR_full_form-1024x576.jpg",
                      month: "Mar",
                      day: "07",
                    ),
SizedBox(
                      height: 20,
                    ),
                    ComingSoonMovieWidget(
                      imageUrl:
                          'https://image.tmdb.org/t/p/original/KoYWXbnYuS3b0GyQPkbuexlVK9.jpg',
                      overview:
                          "When they were boys, Sam and Dean Winchester lost their mother to a mysterious and demonic supernatural force. Subsequently, their father raised them to be soldiers. He taught them about the paranormal evil that lives in the dark corners and on the back roads of America ... and he taught them how to kill it. Now, the Winchester brothers crisscross the country in their '67 Chevy Impala, battling every kind of supernatural threat they encounter along the way.",
                      logoUrl:
                          "https://image.tmdb.org/t/p/original/tUuw06GOurVEmJWg4B39OTA1Jsm.png",
                      month: "Mar",
                      day: "07",
                    ),
                  ],
                ),
              ),
              ComingSoonMovieWidget(
                imageUrl:
                    'https://miro.medium.com/v2/resize:fit:1024/1*P_YU8dGinbCy6GHlgq5OQA.jpeg',
                overview:
                    'When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces, and one strange little girl.',
                logoUrl:
                    "https://logowik.com/content/uploads/images/stranger-things4286.jpg",
                month: "Feb",
                day: "20",
              ),
              FutureBuilder<TvSeriesModel>(
                future: topRatedShows,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var data = snapshot.data!.results;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: data!.length,
                            itemBuilder: (context, index) {
                              DateTime releaseDate = data[index].firstAirDate;
                              String monthName =
                                  DateFormat('MMMM').format(releaseDate);
                              return SingleChildScrollView(
                                child: Column(
                                  children: [
                                    ComingSoonMovieWidget(
                                      imageUrl:
                                          '$imageUrl${data[index].posterPath}',
                                      overview: '${data[index].overview}',
                                      logoUrl:
                                          '$imageUrl${data[index].backdropPath}',
                                      month: '${monthName}',
                                      day: '${data[index].firstAirDate.day}',
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              FutureBuilder<MovieModel>(
                  future: topRatedMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data?.results;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    DateTime releaseDate =
                                        data![index].releaseDate;
                                    String monthName =
                                        DateFormat('MMMM').format(releaseDate);
                                    return SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          ComingSoonMovieWidget(
                                              imageUrl:
                                                  '$imageUrl${data![index].posterPath}',
                                              overview:
                                                  '${data[index].overview}',
                                              logoUrl:
                                                  '$imageUrl${data![index].backdropPath}',
                                              month: '${monthName}',
                                              day:
                                                  '${data[index].releaseDate.day}')
                                        ],
                                      ),
                                    );
                                  }))
                        ],
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  })
              // Add Tab content for Top 10 Movies
            ],
          ),
        ),
      ),
    );
  }
}
