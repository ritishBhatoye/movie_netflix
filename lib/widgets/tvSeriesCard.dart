import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/movie_model.dart';
import 'package:netflix_clone/screens/movie_detailed_screen.dart';
import 'package:netflix_clone/models/tv_series_model.dart';
import 'package:netflix_clone/widgets/tv_card.dart';

class TvSeriescard extends StatelessWidget {
  final Future<TvSeriesModel> future;
  // final TvSeriesModel data;
  final String headlineText;
  const TvSeriescard({
    super.key,
    required this.future,
    required this.headlineText,
    // required this.data
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TvSeriesModel>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data?.results;
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    headlineText,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      // padding: const EdgeInsets.all(3),
                      scrollDirection: Axis.horizontal,
                      itemCount: data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: InkWell(
                              onTap: () {
                                print("Id: ${data[index].id}");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TvDetailedScreen(
                                      year: data[index].firstAirDate,
                                      // genre: data[index].genreIds.
                                      name: data[index].name,
                                      imgUrl: "$imageUrl${data[index].posterPath}",
                                      movieId: data[index].id,
                                      overview: data[index].overview,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Image.network(
                                  '$imageUrl${data[index].posterPath}',
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ));
                      },
                    ),
                  )
                ]);
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
