import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:recipe_app/pages/homepage.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  int _selectedPage = 0;
  final _pageOptions = [
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("You lovly craving is here"),
    );
  }
}
