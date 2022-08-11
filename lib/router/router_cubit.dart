import 'package:flutter_bloc/flutter_bloc.dart';

import 'router_state.dart';

class RouterCubit extends Cubit<RouterState> {
  RouterCubit() : super(RouterState(data: HomeTabData()));

  void push<Tab extends TabData>(Tab data) {
    emit(RouterState<Tab>(data: data));
  }

  bool isInside<Tab extends TabData>() {
    return state.data is Tab;
  }
}
