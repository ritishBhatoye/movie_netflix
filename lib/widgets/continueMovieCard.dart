import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/movie_model.dart';
import 'package:netflix_clone/screens/movie_detailed_screen.dart';

class Continuemoviecard extends StatelessWidget {
  final Future<MovieModel> future;

  final String headlineText;
  const Continuemoviecard({
    super.key,
    required this.future,
    required this.headlineText,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MovieModel>(
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MovieDetailScreen(
                                      movieId: data[index].id,
                                    ),
                                  ),
                                );
                              },
                              child: Stack(

                                alignment: Alignment.center,
                                children:[ Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Image.network(
                                    '$imageUrl${data[index].posterPath}',
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                
                                  
                   Positioned(
                top: 120,
                child: Container(
                  decoration: BoxDecoration(
                          color: Colors.grey[100], 
                    
                  ),
                  width: 121,
                  height: 5,
                  child: Divider(color: Colors.white,thickness: 3,),
                ),
              ),
                                 
                                Positioned(
                top: 120,
                child: Container(
                  

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Play"),
                      Icon(Icons.play_arrow,color: Colors.white,)
                    ],
                  ),
                  decoration: BoxDecoration(
                          color: Color.fromARGB(255, 59, 59, 59).withOpacity(0.9), 
                    
                  ),
                  width: 120,
                  height: 50,
                ),
              ),
               Positioned(
                top: 120,
                left: 0,
                
                child: Container(
                     decoration: BoxDecoration(
                          color: Colors.red, 
                    
                  ),
                   width: 65,
                  height: 5,
                  child: Divider(color: Colors.red,thickness: 3,)
                  )
              ),
]  ),
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
