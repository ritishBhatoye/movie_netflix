import 'package:flutter/material.dart';
import 'package:netflix_clone/models/movie.dart';

class MovieListProvider extends ChangeNotifier {
  
  List<MovieList> _myList = [];

  List<MovieList> get myList => _myList;

  void addToMyList(MovieList movie) {
    _myList.add(movie);
    notifyListeners();
  }

  void removeFromMyList(MovieList movie) {
    _myList.remove(movie);
    notifyListeners();
  }
}



// import 'package:flutter/material.dart';
// import 'package:netflix_clone/models/movie_model.dart';
// import 'package:netflix_clone/screens/streamingPlayer.dart';

// class MovieListProvider extends ChangeNotifier {
//   List<Movie> _myList = [];

//   List<Movie> get myList => _myList;

//   void addToMyList(Movie movie) {
//     _myList.add(movie);
//     notifyListeners();
//   }

//   void removeFromMyList(Movie movie) {
//     _myList.remove(movie);
//     notifyListeners();
//   }
// }
