class OnboardingContent {
  String image;
  String title;
  String descriptions;

  OnboardingContent({
    required this.image,
    required this.title,
    required this.descriptions,
  });
}

List<OnboardingContent> contents = [
  OnboardingContent(
    title: 'QWERTY',
    image: 'assets/testing.jpg',
    descriptions: 'bruh i dont know what is this man i swear to god',
  ),
  OnboardingContent(
    title: 'ASDFGH',
    image: 'assets/testing.jpg',
    descriptions: 'bruh i dont know what is this man i swear to god',
  ),
  OnboardingContent(
    title: 'ZXCVBN',
    image: 'assets/testing.jpg',
    descriptions: 'bruh i dont know what is this man i swear to god',
  ),
];
