import 'router_cubit.dart';

class RouterState<Tab extends TabData> {
  RouterState({required this.data});
  final Tab data;
  bool isInside<Data extends TabData>() {
    return data is Data;
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
