import 'package:flickd/core/utils/constants/app_assets.dart';
import 'package:flickd/core/utils/functions/excute_navigation.dart';
import 'package:flickd/core/utils/functions/store_credentials.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({
    super.key,
  });

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    storeCredentials();
    executeNavigation(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.splashLogo),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
