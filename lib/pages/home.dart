import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Foodie',
              style: TextStyle(color: paragraphColor),
            ),
            SizedBox(width: 6),
            Icon(
              Icons.restaurant_menu,
              color: tertiaryColor,
            ),
            SizedBox(width: 6),
            Text(
              'Recipe',
              style: TextStyle(color: paragraphColor),
            ),
          ],
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: Center(child: Text('this is the home page')),
    );
    // return Center(
    //   child: Text("This is the homepage content"),
    // );
  }
}
