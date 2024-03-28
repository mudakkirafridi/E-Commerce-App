class OnboardingContent {
  String? image;
  String? title;
  String? description;
  OnboardingContent({this.image, this.title, this.description});
}

List<OnboardingContent> content = [
  OnboardingContent(
    description: 'Pick Your Food From Our Menu \n More Than 35 Times',
    image: 'images/screen1.png',
    title: 'Select From Our \n      Best Menu',
  ),
  OnboardingContent(
      description:
          '       You Can Pay Cash On Delivery And \n             Card Payment Is Available',
      image: 'images/screen2.png',
      title: 'Easy And Online Payment'),
  OnboardingContent(
      description: 'Deliver Your Food At Your \n Doorstep',
      image: 'images/screen3.png',
      title: 'Quick Delivery At Your Doorstep')
];
