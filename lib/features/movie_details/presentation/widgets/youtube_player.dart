import 'package:flickd/features/movie_details/presentation/manger/movie_details_cubit/movie_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerCustomWidget extends StatelessWidget {
  const YoutubePlayerCustomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        if (state is MovieDetailsFailure) {
          Center(
            child: Text(state.errorMessage),
          );
        } else if (state is MovieDetailsSucc) {
          YoutubePlayerController controller = YoutubePlayerController(
            initialVideoId: state.movieYouTubeLink,
            flags: const YoutubePlayerFlags(
              autoPlay: false,
              mute: false,
            ),
          );
          return MoviePlayerCustomWidget(
            controller: controller,
          );
        } else {
          return const DummyShimmerSizeBox();
        }
        return const Text('');
      },
    );
  }
}

class DummyShimmerSizeBox extends StatelessWidget {
  const DummyShimmerSizeBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      colorOpacity: 0.5,
      color: Colors.grey[300]!,
      child: const SizedBox(
        height: 200.0,
      ),
    );
  }
}

class MoviePlayerCustomWidget extends StatelessWidget {
  const MoviePlayerCustomWidget({
    super.key,
    required this.controller,
  });

  final YoutubePlayerController controller;

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.red,
      progressColors: const ProgressBarColors(
        playedColor: Colors.red,
        handleColor: Colors.red,
      ),
      onReady: () {},
    );
  }
}
