import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router/app_router.dart';

void executeNavigation({
  required BuildContext context,
}) {
  Future.delayed(
    const Duration(seconds: 5),
    () {
      context.go(AppRouter.kHomeView);
    },
  );
}
