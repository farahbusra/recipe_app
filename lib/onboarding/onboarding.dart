import 'package:flutter/material.dart';
import 'onboarding_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFFFFFE);
    const paragraphColor = Color(0xFF2B2C34);
    const buttonTextColor = Color(0xFFFFFFFE);
    const buttonColor = Color(0xFF6246EA);
    const secondaryColor = Color(0xFFD1D1E9);
    const tertiaryColor = Color(0xFFE45858);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, arr) {
                return Padding(
                  padding:
                      // CopyWith to copy the code and remove the entity
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 100)
                          .copyWith(bottom: 0),
                  child: Column(
                    children: [
                      Image.asset(
                        contents[arr].image,
                        height: 240,
                      ),
                      const SizedBox(height: 30),
                      Text(
                        contents[arr].title,
                        style: const TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        contents[arr].description,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
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
                (index) => buildDot(context, index),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 70,
                width: 130,
                margin: const EdgeInsets.only(
                  bottom: 80,
                ),
                // ignore: deprecated_member_use
                child: FlatButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Text(
                    'Skip',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    navigateToHomePage(context);
                  },
                  textColor: Colors.black,
                ),
              ),
              Container(
                height: 70,
                width: 130,
                margin: const EdgeInsets.only(
                  bottom: 80,
                ),
                // ignore: deprecated_member_use
                child: FlatButton(
                  child: Text(
                    currentIndex == contents.length - 1
                        ? 'Get Started!'
                        : 'Next',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    if (currentIndex == contents.length - 1) {
                      navigateToHomePage(context);
                    }
                    _pageController.nextPage(
                        duration: Duration(milliseconds: 100),
                        curve: Curves.bounceIn);
                  },
                  color: buttonColor,
                  textColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      bottomLeft: Radius.circular(6),
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

  Container buildDot(BuildContext context, int index) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 9, bottom: 50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: currentIndex == index
            ? const Color(0xFF6246EA)
            : const Color(0xFFD1D1E9),
      ),
    );
  }
}

void navigateToHomePage(BuildContext context) {
  Navigator.of(context).pushNamedAndRemoveUntil("/index", (route) => false);
}
