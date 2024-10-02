import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Routes/routess.dart';
import '../../Widgets/Big_text.dart';
import '../../Widgets/Icon_and_text_Widgets.dart';
import '../../Widgets/small_text.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';

class FoodPageBody2 extends StatefulWidget {
  const FoodPageBody2({super.key});

  @override
  State<FoodPageBody2> createState() => _FoodPageBody2State();
}

class _FoodPageBody2State extends State<FoodPageBody2> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  double scaleFactor = 0.8;
  final double _height = Dimension.pageViewContainers;
  final bool _showSearchBox = false;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page ?? 0.0; // Null check
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  List<Map<String, String>> SlidefoodItems = [
    {
      "image": "assets/images/popular_foods/nachos01.jpeg",
      "name": "Nachos",
      "description": "Nachos are a beloved snack or appetizer that combines the crunch of tortilla chips with a variety of flavorful toppings. Originating from Mexican cuisine, they have become a popular choice worldwide for their versatility and ease of preparation. The base of the dish is crispy corn tortilla chips, typically topped with melted cheese, making it a perfect combination of textures.\nNachos can be customized with a wide range of toppings, including seasoned ground beef, shredded chicken, jalapeños, black beans, guacamole, sour cream, and salsa. This allows for endless variations, whether you're aiming for a simple snack with just cheese and salsa, or a fully loaded meal with multiple layers of flavors and ingredients. Some versions also include a drizzle of nacho cheese sauce for extra creaminess.\n\nThis dish is perfect for sharing, making it an excellent choice for social gatherings or game nights. Nachos can be served as a vegetarian option, or with hearty protein additions like beef or chicken to make it more filling. Whether you prefer them spicy or mild, loaded or simple, nachos are a crowd-pleaser that adds a fun and flavorful option to the Food Dash app’s menu, offering something for every palate",
      "price": "350"
    },
    {
      "image": "assets/images/popular_foods/bbq.jpeg",
      "name": "Chicken BBQ",
      "description": "Grilled Chicken BBQ is a popular grilled dish that combines the smoky, savory flavors of barbecued chicken with a delicious blend of spices, marinades, and sauces. It's a favorite for both casual and formal dining, offering a perfect mix of tenderness and rich flavor. Made with chicken marinated in a variety of ingredients such as garlic, ginger, soy sauce, lemon juice, and various herbs, this dish is then grilled over an open flame or on a BBQ grill until perfectly charred.\nThe dish can be customized with different flavors depending on regional preferences. For instance, a sweet BBQ sauce might be added for a rich, tangy taste, while some recipes focus on a spicier kick with chili and pepper seasonings. Chicken BBQ is often served with sides like coleslaw, potato salad, or corn on the cob, making it a full, hearty meal.\n\nIn terms of health benefits, chicken is a lean source of protein, providing essential nutrients such as vitamins B6 and B12, and grilling it allows for fat to drip away, making it a healthier alternative to fried dishes. Chicken BBQ is a versatile dish that fits well with any menu, making it a crowd-pleasing option for a wide range of customers on the Food Dash app.",
      "price": "450"
    },
    {
      "image": "assets/images/popular_foods/pasta.jpeg",
      "name": "Pasta",
      "description": "Italian pasta with rich creamy sauce is a classic and indulgent dish that brings together the simplicity of pasta with the luxurious texture of a creamy sauce. Often made with ingredients like heavy cream, butter, garlic, and Parmesan cheese, the sauce coats the pasta in a velvety, rich layer that melts in your mouth. Some variations include adding a touch of wine, mushrooms, or even smoked meats like pancetta or bacon to enhance the flavors.\nThe pasta used can vary, with popular choices being fettuccine, penne, or spaghetti, which all work well to absorb and hold onto the creamy sauce. The dish is typically garnished with fresh herbs like parsley or basil, and an extra sprinkle of Parmesan, giving it a fragrant and flavorful finish.\n\nItalian creamy pasta offers a perfect balance of carbs and fats, making it both a comforting and satisfying meal. It's a dish that can be enjoyed as a main course or a side, and pairs wonderfully with a fresh salad or garlic bread. Whether you're in the mood for a casual meal or something a bit more sophisticated, this pasta dish is a versatile and delicious choice for any menu on the Food Dash app.",
      "price": "400"
    },
    {
      "image": "assets/images/popular_foods/momos.png",
      "name": "Momos",
      "description": "Momos are a popular type of dumpling, originating from Tibet and widely enjoyed across South Asia. These bite-sized delights are typically filled with a variety of ingredients such as minced meat (chicken, pork, or lamb), vegetables, or a combination of both, making them a versatile dish for different taste preferences. The dough is made from flour and water, and the momos are either steamed or fried to perfection, creating a soft and delicate texture.\nMomos are usually served with a spicy dipping sauce made from chili, garlic, and tomatoes, adding a tangy kick that complements the mild, savory filling. They can be customized in many ways, with options like pan-fried (kothey) momos for a crispy exterior, or even soup-based (jhol) momos for a heartier meal.\nMomos are an excellent choice for a light snack or appetizer but can also be enjoyed as a main dish. Their popularity stems from their simplicity, yet their flavors are rich and satisfying, making them a must-have on any menu, especially for those looking for a quick, flavorful bite on the Food Dash app.",
      "price": "250"
    },
    {
      "image": "assets/images/popular_foods/Sushi.png",
      "name": "Sushi Platter",
      "description": "Sushi is a quintessential Japanese dish, celebrated for its balance of fresh ingredients and elegant presentation. It typically consists of vinegared rice, raw or cooked seafood (such as tuna, salmon, or shrimp), and vegetables, all carefully rolled or layered together. Sushi comes in many forms, such as maki (rolls), nigiri (fish slices on rice), and sashimi (sliced raw fish served without rice), offering something for every palate.\nThe dish is often accompanied by soy sauce, pickled ginger, and wasabi, which add savory, tangy, and spicy elements that enhance the natural flavors of the fresh ingredients. Sushi is not only known for its taste but also for its health benefits, being a low-fat, high-protein dish that incorporates omega-3-rich fish and vegetables.\n\nSushi is a versatile dish suitable for any occasion, whether it's a light lunch, a fancy dinner, or even a party platter. Its delicate flavors and artful presentation make it a premium offering on the Food Dash app, appealing to those who enjoy fresh, healthy, and visually stunning cuisine.",
      "price": "600"
    },
  ];
  List<Map<String, String>> listfoodItems = [
    {"image": "assets/images/bestfood/ic_best_food_1.jpeg", "name": "Biryani"},
    {
      "image": "assets/images/bestfood/ic_best_food_2.jpeg",
      "name": "Avocado Chicken Salad"
    },
    {
      "image": "assets/images/bestfood/ic_best_food_3.jpeg",
      "name": "Spinach and Crab stuffed Salmon w/lemon cream sauce"
    },
    {
      "image": "assets/images/bestfood/ic_best_food_4.jpeg",
      "name": "Char Siu (Chinese BBQ Pork)"
    },
    {
      "image": "assets/images/bestfood/ic_best_food_5.jpeg",
      "name": "Cheesy BBQ Chicken Pizza"
    },
    {
      "image": "assets/images/bestfood/ic_best_food_6.jpeg",
      "name": "Tandoori Paneer Tikka"
    },
    {
      "image": "assets/images/bestfood/ic_best_food_7.jpeg",
      "name": "Chicken Tacos"
    },
    {
      "image": "assets/images/bestfood/ic_best_food_8.jpeg",
      "name": "Indian Veg meals"
    },
    {
      "image": "assets/images/bestfood/ic_best_food_9.jpeg",
      "name": "Chicken Caesar Wrap"
    },
    {
      "image": "assets/images/bestfood/ic_best_food_10.jpeg",
      "name": "Black Pepper Stir Fried Udon"
    },
    {
      "image": "assets/images/bestfood/ic_best_food_60.jpeg",
      "name": "Meatballs and spaghetti"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Slider section
          SizedBox(
            height: Dimension.pageView,
            child: PageView.builder(
              controller: pageController,
              itemCount: SlidefoodItems.length,
              itemBuilder: (context, position) {
                return _buildPageItem(position, SlidefoodItems[position]);
              },
            ),
          ),
          // Dots indicator
          DotsIndicator(
            dotsCount: SlidefoodItems.length,
            position: _currentPageValue,
          ),

          // Popular Text //
          Container(
            margin: EdgeInsets.only(left: Dimension.width30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const BigText(text: "Popular"),
                SizedBox(width: Dimension.width10),
                Container(
                  margin: const EdgeInsets.only(bottom: 3),
                  child: const BigText(text: ".", color: Colors.black54),
                ),
                SizedBox(width: Dimension.width10),
                Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  child: const SmallText(text: "Food pairing"),
                ),
              ],
            ),
          ),

          // List of food items
          SizedBox(
            height: 1250,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: listfoodItems.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {//list food page controllers here//
                    Get.toNamed(RoutesHelper.getRecommendedFood(index));
                  },

                  child: Container(
                    margin: EdgeInsets.only(
                        left: Dimension.width20,
                        right: Dimension.width20,
                        bottom: Dimension.height10),
                    child: Row(
                      children: [
                        // List Image section
                        Container(
                          height: Dimension.listviewImageSize,
                          width: Dimension.listviewImageSize,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimension.radius20),
                            color: Colors.white38,
                            image: DecorationImage(
                              image: AssetImage(listfoodItems[index]['image'] ??
                                  'assets/images/placeholder.png'), // Null check with default image
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // Text section
                        Expanded(
                          child: Container(
                            height: Dimension.ListViewTextContSize,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(Dimension.radius20),
                                bottomRight:
                                    Radius.circular(Dimension.radius20),
                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: Dimension.width10,
                                  right: Dimension.width10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // List food name
                                  BigText(
                                      text: listfoodItems[index]["name"] ??
                                          "Unknown"), // Null check with fallback text
                                  SizedBox(height: Dimension.height10),
                                  const SmallText(
                                      text: "Delicious and popular dish"),
                                  SizedBox(height: Dimension.height10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const IconAndTextWidget(
                                          icon: Icons.circle_sharp,
                                          iconColor: AppColor.iconColor1,
                                          text: "Normal"),
                                      SizedBox(width: Dimension.width15),
                                      const IconAndTextWidget(
                                          icon: Icons.location_on,
                                          iconColor: AppColor.mainColor,
                                          text: "1.5km"),
                                      SizedBox(width: Dimension.width15),
                                      const IconAndTextWidget(
                                          icon:
                                              Icons.access_time_filled_rounded,
                                          iconColor: AppColor.iconColor2,
                                          text: "28min"),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildPageItem(int index, Map<String, String> foodItem) {
    Matrix4 matrix = Matrix4.identity();
    double currentScale = 0.8;
    double currentTrans = _height * (1 - currentScale) / 2;

    if (index == _currentPageValue.floor()) {
      // Current page
      currentScale = 1 - (_currentPageValue - index) * (1 - scaleFactor);
      currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      // Next page
      currentScale = scaleFactor + (_currentPageValue - index + 1) * (1 - scaleFactor);
      currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      // Previous page
      currentScale = 1 - (_currentPageValue - index) * (1 - scaleFactor);
      currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else {
      // Other pages, set the scale to 0.8
      currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, _height * (1 - currentScale) / 2, 0);
    }

    matrix = Matrix4.diagonal3Values(1, currentScale, 1)
      ..setTranslationRaw(0, currentTrans, 0);

    return Transform(
      transform: matrix,
      child: GestureDetector(
        onTap: () {
          //Slideable food page controller here//
          Get.toNamed(RoutesHelper.getPopularFoodDetails(index));
          },

        child: Stack(
          children: [
            // Background image container
            Container(
              height: _height,
              margin: EdgeInsets.only(
                  left: Dimension.width10, right: Dimension.width10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.radius30),
                color: index.isEven ? Colors.amber : Colors.green,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(foodItem['image'] ??
                      'assets/images/placeholder.png'), // Null check with default image
                ),
              ),
            ),

            // Bottom food details container
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 130, // Adjust height dynamically if necessary
                margin: EdgeInsets.only(
                    left: Dimension.width30,
                    right: Dimension.width30,
                    bottom: Dimension.height30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimension.radius20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0, 5)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: Dimension.height10, left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Food name
                      BigText(
                          text: foodItem["name"] ??
                              "Unknown"), // Null check with fallback text
                      SizedBox(height: Dimension.height10),

                      // Rating and comments section
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(
                                5,
                                (index) => const Icon(Icons.star,
                                    color: AppColor.mainColor)),
                          ),
                          SizedBox(width: Dimension.width20),
                          const SmallText(text: "4.8"),
                          // Dynamic rating can be passed here
                          SizedBox(width: Dimension.width20),
                          const SmallText(text: "156"),
                          // Dynamic comments count can be passed here
                          const SmallText(text: "Comments"),
                        ],
                      ),

                      SizedBox(height: Dimension.height10),

                      // Icon and text row
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconAndTextWidget(
                              icon: Icons.circle_sharp,
                              text: "Normal",
                              iconColor: AppColor.iconColor1),
                          IconAndTextWidget(
                              icon: Icons.location_on,
                              text: "1.5km",
                              iconColor: AppColor.mainColor),
                          IconAndTextWidget(
                              icon: Icons.access_time_rounded,
                              text: "28min",
                              iconColor: AppColor.iconColor2),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
