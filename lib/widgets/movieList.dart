class MovieListPersonalised {
  final int id;
  final String title;
  final String posterPath;
  final String overview;
  final bool adult;
  final String releaseDate;
  // final List<Genre> genres;

  MovieListPersonalised ({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
    required this.adult,
    required this.releaseDate,
    // required this.genres,
  });

  factory MovieListPersonalised .fromJson(Map<String, dynamic> json) {
    return MovieListPersonalised (
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'],
      overview: json['overview'],
      adult: json['adult'],
      releaseDate: json['release_date'],
      // genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
    );
  }
}

// class Genre {
//   final int id;
//   final String name;

//   Genre({
//     required this.id,
//     required this.name,
//   });

//   factory Genre.fromJson(Map<String, dynamic> json) {
//     return Genre(
//       id: json['id'],
//       name: json['name'],
//     );
//   }
// }
