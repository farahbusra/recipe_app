import 'package:flutter/material.dart';
import 'package:recipe_app/pages/recipe_detail.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({Key? key}) : super(key: key);

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  late final TextEditingController _controller;
  bool _isRecipeNameEmpty = true;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();
    _controller.addListener(() {
      setState(() {
        _isRecipeNameEmpty = _controller.text.isEmpty;
      });
    });
  }

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
              'Recipe',
              style: TextStyle(color: paragraphColor),
            ),
            SizedBox(width: 6),
          ],
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Please enter recipe name',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  hintText: 'Food name', border: OutlineInputBorder()),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(buttonColor)),
            child: const Text('Search'),
            onPressed: _isRecipeNameEmpty
                ? null
                : () {
                    Navigator.pushNamed(context, '/recipedetail',
                        arguments: RecipeDetail(foodName: _controller.text));
                  },
          )
        ],
      )),
    );
  }
}
