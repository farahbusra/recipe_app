import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'onboarding_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              // itemCount: contents.length,
              // onboardingScreenChanged: (int index) {
              //   setState(() {

              //   });
              // },
              itemBuilder: (_, arr) {
                return Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Image.asset(
                        contents[arr].image,
                        height: 300,
                      ),
                      Text(
                        contents[arr].title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        contents[arr].descriptions,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contents.length,
                (index) => buildBot(context, index),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 80,
                width: 140,
                margin: const EdgeInsets.only(
                  top: 40,
                  bottom: 40,
                ),
                child: FlatButton(
                  child: Text('Prev'),
                  onPressed: () {},
                  textColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                ),
              ),
              Container(
                height: 80,
                width: 140,
                margin: const EdgeInsets.only(
                  top: 40,
                  bottom: 40,
                ),
                child: FlatButton(
                  child: Text('Next'),
                  onPressed: () {},
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container buildBot(BuildContext context, int index) {
    return Container(
      height: 10,
      width: 10,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
