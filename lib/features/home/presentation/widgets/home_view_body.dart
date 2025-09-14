import 'dart:developer';
import 'package:flickd/core/utils/constants/sizes.dart';
import 'package:flickd/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:flickd/features/home/presentation/widgets/movie_toggle_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'back_gorund_image_custom_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    log(MediaQuery.of(context).size.width.toString());
    return Stack(
      fit: StackFit.expand,
      children: [
        const MovieBackGroundCustomWidget(),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: ResponsiveScaledBox(
            width: ResponsiveValue<double>(
              context,
              conditionalValues: [
                const Condition.between(start: 0, end: 450, value: 480),
                const Condition.between(start: 451, end: 800, value: 480),
              ],
            ).value,
            child: const Column(
              children: [
                CustomAppBar(),
                SizedBox(
                  height: AppSizes.defaultSpacing,
                ),
                Expanded(
                  child: MovieToggleBlocBuilder(),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
