//food items
class FoOd{
  final String name;//cheese burger
  final String discriptions;//a burger with full of cheese..
  final String imagePath;//lib/image/assets/image.png
  final double price;//120tk
  final FoodCatagory catagory;//burger
  List<Addon> availableAddons;//[extra cheese,patty,sauce..]
FoOd({
  required this.name,
  required this.discriptions,
  required this.imagePath,
  required this.price,
  required this.catagory,
  required this.availableAddons,

});

}
enum FoodCatagory{
  Polular,
  Burger,
  Drinks, Noodles, Wrap, MainCourse, Tacos, Appetizer, Pizza, Seafood, Salad, Pasta,
}
//Addon items//
class Addon{
   late String name;
  late double price;

Addon({
  required this.name,
  required this.price,
});
}
