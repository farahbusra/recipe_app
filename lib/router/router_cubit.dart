import 'package:flutter_bloc/flutter_bloc.dart';

import 'router_state.dart';

class RouterCubit extends Cubit<RouterState> {
  RouterCubit() : super(RouterState(data: HomeTabData()));

  void push<T extends TabData>(T data) {
    emit(RouterState<T>(data: data));
  }

  bool isInside<T extends TabData>() {
    return state.data is T;
  }
}
