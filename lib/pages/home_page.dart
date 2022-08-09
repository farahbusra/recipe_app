import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:recipe_app/pages/recipe_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Recipe'),
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
            child: const Text('Search'),
            onPressed: _isRecipeNameEmpty
                ? null
                : () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                RecipeDetail(foodName: _controller.text)));
                  },
          )
        ],
      )),
    );
  }
}
