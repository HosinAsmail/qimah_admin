import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qimah_admin/data.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    // print(change);
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
    logger.w(transition);
    super.onTransition(bloc, transition);
  }
}
