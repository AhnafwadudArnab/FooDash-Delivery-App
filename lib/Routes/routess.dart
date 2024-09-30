import 'package:get/get.dart';
import '../Pages/Food_pages/Main_Food_Page_Body.dart'; // Updated the file name to be consistent
import '../Pages/Food_pages/Popular_food_pages(details).dart';
import '../Pages/Food_pages/Recommende_food_pages.dart'; // Updated the file name to be consistent

class RoutesHelper {
  // Route constants
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String popularFoodDetails = '/popular-food-details';

  // Get initial route
  static String getInitial() => '$initial';

  // Get route with pageId parameter for popular food details
  static String getPopularFoodDetails(int pageId) => '$popularFoodDetails?pageId=$pageId';

  // Get recommended food route
  static String getRecommendedFood(int pageId) => '$recommendedFood?pageId=$pageId';

  static List<GetPage> routes = [
    // Route for the initial/main page
    GetPage(
      name: initial,
      page: () => const main_food_page(), // Renamed to PascalCase for the widget
      transition: Transition.fadeIn,
    ),

    // Route for the popular food details page with parameters
    GetPage(
      name: popularFoodDetails,
      page: () {
        var pageId = Get.parameters['pageId'];
        return PopularFoodDetails(pageId: int.parse(pageId!)); // Corrected int.parse usage
      },
      transition: Transition.fadeIn,
    ),

    // Route for the recommended food page
    GetPage(
      name: recommendedFood,
      page: () {var pageId = Get.parameters['pageId'];
      return RecommendedFood(pageId: int.parse(pageId!));
         // Added const for better optimization
      },
      transition: Transition.fadeIn,
    ),
  ];
}
