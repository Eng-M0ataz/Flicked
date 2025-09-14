import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlockObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log(change.toString());
    super.onChange(bloc, change);
  }

  @override
  void onCreate(BlocBase bloc) {
    log(bloc.toString());
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase bloc) {
    log(bloc.toString());
    super.onClose(bloc);
  }
}
