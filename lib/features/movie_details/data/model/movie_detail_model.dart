import 'package:flickd/features/movie_details/domin/entity/movie_details_entity.dart';

class MovieDetailModel extends MovieDetailsEntity {
  final String movieYouTubeKey;
  MovieDetailModel({
    required this.movieYouTubeKey,
  }) : super(
          movieyoutubeTrailerUrl: movieYouTubeKey,
        );
  factory MovieDetailModel.fromJson({required Map<String, dynamic> json}) =>
      MovieDetailModel(
        movieYouTubeKey: json['key'],
      );
}
