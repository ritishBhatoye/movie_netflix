import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/movie_model.dart';
import 'package:netflix_clone/models/tv_series_model.dart';
import 'package:netflix_clone/screens/movie_detailed_screen.dart';
import 'package:netflix_clone/widgets/coming_soon_movie_widget.dart';

class TopTvShow extends StatefulWidget {
  final Future<TvSeriesModel> future;
  const TopTvShow({
    super.key,
    required this.future,
  });

  @override
  State<TopTvShow> createState() => _TopTvShowState();
}

class _TopTvShowState extends State<TopTvShow> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TvSeriesModel>(
        future: widget.future,
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
                            return SingleChildScrollView(
                              child: Column(
                                children: [
                                  ComingSoonMovieWidget(
                                      imageUrl:
                                          '$imageUrl${data![index].posterPath}',
                                      overview: '${data[index].overview}',
                                      logoUrl:
                                          '$imageUrl${data![index].backdropPath}',
                                      month:
                                          '${data[index].firstAirDate.month}',
                                      day: '${data[index].firstAirDate.day}')
                                ],
                              ),
                            );
                          }))
                ]);
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}


// children: [
//                   Text(
//                     headlineText,
//                     style: const TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Expanded(
//                     child: ListView.builder(
//                       shrinkWrap: true,
//                       // padding: const EdgeInsets.all(3),
//                       scrollDirection: Axis.horizontal,
//                       itemCount: data!.length,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                             padding: const EdgeInsets.all(5.0),
//                             child: InkWell(
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => MovieDetailScreen(
//                                       movieId: data[index].id,
//                                     ),
//                                   ),
//                                 );
//                               },
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(20)),
//                                 child: Image.network(
//                                   '$imageUrl${data[index].posterPath}',
//                                   fit: BoxFit.fitHeight,
//                                 ),
//                               ),
//                             ));
//                       },
//                     ),
//                   )