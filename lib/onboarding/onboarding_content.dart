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
    title: 'Recipe Is A Story That Ends With A Good Meal',
    image: 'assets/testing.jpg',
    descriptions: 'bruh i dont know what is this man i swear to god',
  ),
  OnboardingContent(
    title: 'Discover New Recipe With Us',
    image: 'assets/testing.jpg',
    descriptions: 'bruh i dont know what is this man i swear to god',
  ),
  OnboardingContent(
    title: 'Cooking Experiece Like A Professional Chef',
    image: 'assets/testing.jpg',
    descriptions: 'bruh i dont know what is this man i swear to god',
  ),
];
