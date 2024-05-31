import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/movie_model.dart';
import 'package:netflix_clone/models/tv_series_model.dart';
import 'package:netflix_clone/services/api_services.dart';
import 'package:netflix_clone/widgets/coming_soon_movie_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TopMovieList extends StatefulWidget {
  final Future<MovieModel> future;
  const TopMovieList({super.key, required this.future});

  @override
  State<TopMovieList> createState() => _TopMovieListState();
}

class _TopMovieListState extends State<TopMovieList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MovieModel>(
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
                                    month: '${data[index].releaseDate.month}',
                                    day: '${data[index].releaseDate.day}')
                              ],
                            ),
                          );
                        }))
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
