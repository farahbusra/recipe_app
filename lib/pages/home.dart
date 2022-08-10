import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFFFFFE);
    const paragraphColor = Color(0xFF2B2C34);
    const buttonTextColor = Color(0xFFFFFFFE);
    const buttonColor = Color(0xFF6246EA);
    const secondaryColor = Color(0xFFD1D1E9);
    const tertiaryColor = Color(0xFFE45858);

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Foodie',
              style: TextStyle(color: primaryColor),
            ),
            SizedBox(width: 6),
            Icon(
              Icons.restaurant_menu,
              color: primaryColor,
            ),
            SizedBox(width: 6),
            Text(
              'Recipe',
              style: TextStyle(color: primaryColor),
            ),
          ],
        ),
        toolbarHeight: 80,
        elevation: 0,
        centerTitle: true,
        backgroundColor: buttonColor,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(
                'Hello, Natalie!',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: paragraphColor,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Make your own food,\nstay at home!',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    color: paragraphColor,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Search Bar Function
              CupertinoSearchTextField(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                borderRadius: BorderRadius.circular(6),
                placeholder: 'Search Recipe',
              ),
              const SizedBox(height: 16),
              Text(
                'Popular Recipes',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    color: paragraphColor,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                height: 300,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    recipeCard(),
                    const SizedBox(width: 20),
                    recipeCard(),
                    const SizedBox(width: 20),
                    recipeCard(),
                    const SizedBox(width: 20),
                    recipeCard(),
                    const SizedBox(width: 20),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget recipeCard() => Container(
        width: 300,
        // height: 240,
        color: Colors.grey,
        child: Column(
          children: [
            Image.asset('assets/onboarding_1.png'),
            Text(
              'Chicken',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            )
          ],
        ),
      );
}
