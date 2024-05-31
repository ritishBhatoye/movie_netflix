import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:netflix_clone/widgets/movieList.dart';
class WishlistManager extends ChangeNotifier {
  final List<MovieListPersonalised> _wishlist = [];

  List<MovieListPersonalised > get wishlist => _wishlist;

  void addToWishlist(MovieListPersonalised  movie) {
    _wishlist.add(movie);
    notifyListeners();
  }

  void removeFromWishlist(MovieListPersonalised  movie) {
    _wishlist.remove(movie);
    notifyListeners();
  }
}