import 'package:recipe_app/pages/onboarding.dart';

class onboardingContent {
  String image;
  String title;
  String descriptions;

  onboardingContent({
    required this.image,
    required this.title,
    required this.descriptions,
  });
}

List<onboardingContent> contents = [
  onboardingContent(
    title: 'QWERTY',
    image: 'assets/testing.jpg',
    descriptions: 'bruh i dont know what is this man i swear to god',
  ),
  onboardingContent(
    title: 'ASDFGH',
    image: 'assets/testing.jpg',
    descriptions: 'bruh i dont know what is this man i swear to god',
  ),
  onboardingContent(
    title: 'ZXCVBN',
    image: 'assets/testing.jpg',
    descriptions: 'bruh i dont know what is this man i swear to god',
  ),
];
