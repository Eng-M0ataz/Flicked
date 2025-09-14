import 'package:flickd/features/home/domin/entity/movie_entity.dart';

class MovieModel extends MovieEntity {
  bool? adult;
  String? backdropPath;
  List<dynamic>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String fullImageUrl;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  MovieModel({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    required this.fullImageUrl,
  }) : super(
          movieId: id!,
          movieTitle: title!,
          imageUrl: fullImageUrl,
          isAdult: adult.toString(),
          movieAvarageVote: voteAverage!.toStringAsPrecision(2),
          movieDescruption: overview ?? 'no overview available for this movie',
          movieLanguage: originalLanguage!,
          movieReleaseDate: releaseDate!,
        );

  factory MovieModel.fromJson(
      {required Map<String, dynamic> json, required String imageBaseUrl, s}) {
    return MovieModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genreIds: json['genre_ids'],
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: (json['popularity'] as num?)?.toDouble(),
      fullImageUrl: '$imageBaseUrl${json['poster_path']}',
      releaseDate: json['release_date'],
      title: json['title'],
      video: json['video'],
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'],
    );
  }
}
