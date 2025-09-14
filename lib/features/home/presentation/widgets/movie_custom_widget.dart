import 'package:flickd/features/home/domin/entity/movie_entity.dart';
import 'package:flickd/features/home/presentation/widgets/movie_details.dart';
import 'package:flickd/features/home/presentation/widgets/movie_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomMovieItem extends StatelessWidget {
  const CustomMovieItem({
    super.key,
    required this.movieEntity,
    required this.isLoading,
    required this.onpressed,
  });
  final MovieEntity movieEntity;
  final bool isLoading;
  final void Function() onpressed;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: Container(
        width: 200,
        height: 300,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          height: 230,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieImageCustomWidget(image: movieEntity.imageUrl),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(
                            movieEntity.movieTitle,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              movieEntity.movieAvarageVote,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    MovieDetails(
                      movieEntity: movieEntity,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      movieEntity.movieDescruption,
                      maxLines: 7,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: onpressed,
                        child: const Text('Read More'),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
