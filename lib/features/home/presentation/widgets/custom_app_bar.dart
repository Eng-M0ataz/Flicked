import 'package:flickd/core/utils/constants/sizes.dart';
import 'package:flickd/features/home/presentation/manger/Movie_list_toogle_cubit/movies_list_toggle_cubit.dart';
import 'package:flickd/features/home/presentation/widgets/custom_drob_down_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Card(
        color: Colors.transparent.withOpacity(0.4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppSizes.borderRadiusXl,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: AppSizes.paddingLg,
            right: AppSizes.paddingMd,
          ),
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(
                  top: 11,
                ),
                hintText: 'Search...',
                prefixIcon: const Icon(
                  Icons.search,
                  size: AppSizes.mdIcon,
                ),
                suffixIcon:
                    BlocBuilder<MoviesListToggleCubit, MoviesListToggleState>(
                  builder: (context, state) {
                    return CustomDrobDownButton(
                      onChanged: (value) {
                        if (value == 'Popular') {
                          context
                              .read<MoviesListToggleCubit>()
                              .showPopularMovies();
                        } else {
                          context
                              .read<MoviesListToggleCubit>()
                              .showUpcomingMovies();
                        }
                      },
                      choice: state is MoviesListToggleUpcomming
                          ? 'Upcoming'
                          : 'Popular',
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
