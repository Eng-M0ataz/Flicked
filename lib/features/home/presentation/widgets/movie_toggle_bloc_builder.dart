import 'package:flickd/core/utils/constants/dummy_list.dart';
import 'package:flickd/features/home/domin/entity/movie_entity.dart';
import 'package:flickd/features/home/presentation/manger/Movie_list_toogle_cubit/movies_list_toggle_cubit.dart';
import 'package:flickd/features/home/presentation/manger/get_movies_cubit/get_movies_cubit.dart';
import 'package:flickd/features/home/presentation/manger/get_movies_cubit/get_movies_cubit_state.dart';
import 'package:flickd/features/home/presentation/manger/upcomming_movie_cubit/upcoming_movie_cubit.dart';
import 'package:flickd/features/home/presentation/manger/upcomming_movie_cubit/upcoming_movie_state.dart';
import 'package:flickd/features/home/presentation/widgets/upcomming_movies_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'popular_movies_listview.dart';

class MovieToggleBlocBuilder extends StatefulWidget {
  const MovieToggleBlocBuilder({
    super.key,
  });

  @override
  State<MovieToggleBlocBuilder> createState() => _MovieToggleBlocBuilderState();
}

class _MovieToggleBlocBuilderState extends State<MovieToggleBlocBuilder> {
  List<MovieEntity> popularMoviesList = [];
  List<MovieEntity> upcommingMoviesList = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesListToggleCubit, MoviesListToggleState>(
      builder: (context, state) {
        if (state is MoviesListTogglePopular) {
          return BlocConsumer<PopularMovieCubit, PopularMoviesCubitState>(
            listener: (context, state) => {
              if (state is PopularMoviesSuccState)
                {
                  popularMoviesList.addAll(state.moviesList),
                }
            },
            builder: (context, state) {
              if (state is PopularMoviesSuccState ||
                  state is PopularMoviesPaginationLoadingState) {
                return PopularMovieListView(
                  isLoading: false,
                  movieEntity: popularMoviesList,
                );
              } else if (state is PopularMoviesFailureState) {
                return Center(
                  child: Text(state.errorMessage),
                );
              } else {
                return const PopularMovieListView(
                  isLoading: true,
                  movieEntity: dummyMoviesList,
                );
              }
            },
          );
        } else {
          return BlocConsumer<UpcomingMovieCubit, UpcommingMoviesCubitState>(
            listener: (context, state) => {
              if (state is UpcommingMoviesSuccState)
                {
                  upcommingMoviesList.addAll(state.moviesList),
                }
            },
            builder: (context, state) {
              if (state is UpcommingMoviesSuccState ||
                  state is UpcommingMoviesPaginationLoadingState) {
                return UpcommingMoviesListView(
                  isLoading: false,
                  movieEntity: upcommingMoviesList,
                );
              } else if (state is UpcommingMoviesFailureState) {
                return Center(
                  child: Text(state.errorMessage),
                );
              } else {
                return const UpcommingMoviesListView(
                  isLoading: true,
                  movieEntity: dummyMoviesList,
                );
              }
            },
          );
        }
      },
    );
  }
}
