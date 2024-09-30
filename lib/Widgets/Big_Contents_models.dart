class UnboardingContent{
  String Image;
  String title;
  String description;

  UnboardingContent({required this.description, required this.Image,required this.title });
}
List<UnboardingContent> contents =[
  UnboardingContent(
      description: "Pick your food from our menu\n         More than 30itmes ",
      Image: "assets/icons/screen1.png",
      title: "Select from our \n    Best Menu"),
  UnboardingContent(
      description: "You can pay cash on ddelivery and\n       card payment is available ",
      Image: "assets/icons/screen2.png",
      title: "Easy and online payment "),
  UnboardingContent(
      description: "Deliver your food at your\n            Door-step ",
      Image: "assets/icons/screen3.png",
      title: "Quick delivary at your Door-Step "),
];