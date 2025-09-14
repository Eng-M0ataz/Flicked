import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flickd/features/home/presentation/manger/get_movies_cubit/get_movies_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manger/Movie_list_toogle_cubit/movies_list_toggle_cubit.dart';
import '../manger/get_movies_cubit/get_movies_cubit.dart';
import '../manger/upcomming_movie_cubit/upcoming_movie_cubit.dart';
import '../manger/upcomming_movie_cubit/upcoming_movie_state.dart';

class MovieBackGroundCustomWidget extends StatelessWidget {
  const MovieBackGroundCustomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesListToggleCubit, MoviesListToggleState>(
      builder: (context, toggleState) {
        if (toggleState is MoviesListTogglePopular) {
          return BlocBuilder<PopularMovieCubit, PopularMoviesCubitState>(
            builder: (context, popularState) {
              if (popularState is PopularMoviesSuccState) {
                return buildBackgroundImage(popularState.movieImageUrl);
              } else {
                return const SizedBox();
              }
            },
          );
        } else if (toggleState is MoviesListToggleUpcomming) {
          // Use UpcomingMovieCubit when upcoming is selected
          return BlocBuilder<UpcomingMovieCubit, UpcommingMoviesCubitState>(
            builder: (context, upcomingMoviesState) {
              if (upcomingMoviesState is UpcommingMoviesSuccState) {
                return buildBackgroundImage(upcomingMoviesState.movieImageUrl);
              } else {
                return const SizedBox();
              }
            },
          );
        }
        return const Text('Error: Invalid toggle state');
      },
    );
  }
}

Widget buildBackgroundImage([String? imageUrl = '']) {
  return ClipRRect(
    child: ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: CachedNetworkImage(
        imageUrl: imageUrl ?? '',
        fit: BoxFit.cover,
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    ),
  );
}
