class OnboardingContent {
  String image;
  String title;
  String description;

  OnboardingContent({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnboardingContent> contents = [
  OnboardingContent(
    title: 'Recipe Is A Story That Ends With A Good Meal',
    image: 'assets/onboarding_1.png',
    description:
        'We provide clear instructions for you to cook a wonderful meal and share it with your love ones.',
  ),
  OnboardingContent(
    title: 'Discover New Recipe With Us',
    image: 'assets/onboarding_2.png',
    description:
        'We provide various food recipe from across the world to cook and try out new recipes.',
  ),
  OnboardingContent(
    title: 'Cooking Experiece Like A Professional Chef',
    image: 'assets/onboarding_3.png',
    description:
        'Fear nothing! With us you get to experience how to cook like a professional chef.',
  ),
];
