import 'router_cubit.dart';

class RouterState<T extends TabData> {
  RouterState({required this.data});
  final T data;
  bool isInside<D extends TabData>() {
    return data is D;
  }
}

abstract class TabData {
  final String name;
  TabData({required this.name});
}

class HomeTabData extends TabData {
  HomeTabData() : super(name: "Home");
}

class RecipeTabData extends TabData {
  RecipeTabData() : super(name: "Recipe");
}

class FavTabData extends TabData {
  FavTabData() : super(name: "Fav");
}

class ProfileTabData extends TabData {
  ProfileTabData() : super(name: "Profile");
}
