import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Widgets/Big_text.dart';
import '../../Widgets/Expandable_text.dart';
import '../../Widgets/app_col_spacebetween.dart';
import '../../Widgets/app_icons.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../Utility/SideXbar/newCArtPg.dart';
class PopularFoodDetails extends StatefulWidget {
  final List<Map<String, String>> SlidefoodItems = [
  {
    "image": "assets/images/popular_foods/nachos01.jpeg",
    "name": "Nachos",
    "description":
    "Nachos are a beloved snack or appetizer that combines the crunch of tortilla chips with a variety of flavorful toppings. Originating from Mexican cuisine, they have become a popular choice worldwide for their versatility and ease of preparation. The base of the dish is crispy corn tortilla chips, typically topped with melted cheese, making it a perfect combination of textures.\nNachos can be customized with a wide range of toppings, including seasoned ground beef, shredded chicken, jalapeños, black beans, guacamole, sour cream, and salsa. This allows for endless variations, whether you're aiming for a simple snack with just cheese and salsa, or a fully loaded meal with multiple layers of flavors and ingredients. Some versions also include a drizzle of nacho cheese sauce for extra creaminess.\n\nThis dish is perfect for sharing, making it an excellent choice for social gatherings or game nights. Nachos can be served as a vegetarian option, or with hearty protein additions like beef or chicken to make it more filling. Whether you prefer them spicy or mild, loaded or simple, nachos are a crowd-pleaser that adds a fun and flavorful option to the Food Dash app’s menu, offering something for every palate",
    "price": "350"
  },
  {
    "image": "assets/images/popular_foods/bbq.jpeg",
    "name": "Chicken BBQ",
    "description":
    "Grilled Chicken BBQ is a popular grilled dish that combines the smoky, savory flavors of barbecued chicken with a delicious blend of spices, marinades, and sauces. It's a favorite for both casual and formal dining, offering a perfect mix of tenderness and rich flavor. Made with chicken marinated in a variety of ingredients such as garlic, ginger, soy sauce, lemon juice, and various herbs, this dish is then grilled over an open flame or on a BBQ grill until perfectly charred.\nThe dish can be customized with different flavors depending on regional preferences. For instance, a sweet BBQ sauce might be added for a rich, tangy taste, while some recipes focus on a spicier kick with chili and pepper seasonings. Chicken BBQ is often served with sides like coleslaw, potato salad, or corn on the cob, making it a full, hearty meal.\n\nIn terms of health benefits, chicken is a lean source of protein, providing essential nutrients such as vitamins B6 and B12, and grilling it allows for fat to drip away, making it a healthier alternative to fried dishes. Chicken BBQ is a versatile dish that fits well with any menu, making it a crowd-pleasing option for a wide range of customers on the Food Dash app.",
    "price": "450"
  },
  {
    "image": "assets/images/popular_foods/pasta.jpeg",
    "name": "Pasta",
    "description":
    "Italian pasta with rich creamy sauce is a classic and indulgent dish that brings together the simplicity of pasta with the luxurious texture of a creamy sauce. Often made with ingredients like heavy cream, butter, garlic, and Parmesan cheese, the sauce coats the pasta in a velvety, rich layer that melts in your mouth. Some variations include adding a touch of wine, mushrooms, or even smoked meats like pancetta or bacon to enhance the flavors.\nThe pasta used can vary, with popular choices being fettuccine, penne, or spaghetti, which all work well to absorb and hold onto the creamy sauce. The dish is typically garnished with fresh herbs like parsley or basil, and an extra sprinkle of Parmesan, giving it a fragrant and flavorful finish.\n\nItalian creamy pasta offers a perfect balance of carbs and fats, making it both a comforting and satisfying meal. It's a dish that can be enjoyed as a main course or a side, and pairs wonderfully with a fresh salad or garlic bread. Whether you're in the mood for a casual meal or something a bit more sophisticated, this pasta dish is a versatile and delicious choice for any menu on the Food Dash app.",
    "price": "400"
  },
  {
    "image": "assets/images/popular_foods/momos.png",
    "name": "Momos",
    "description":
    "Momos are a popular type of dumpling, originating from Tibet and widely enjoyed across South Asia. These bite-sized delights are typically filled with a variety of ingredients such as minced meat (chicken, pork, or lamb), vegetables, or a combination of both, making them a versatile dish for different taste preferences. The dough is made from flour and water, and the momos are either steamed or fried to perfection, creating a soft and delicate texture.\nMomos are usually served with a spicy dipping sauce made from chili, garlic, and tomatoes, adding a tangy kick that complements the mild, savory filling. They can be customized in many ways, with options like pan-fried (kothey) momos for a crispy exterior, or even soup-based (jhol) momos for a heartier meal.\nMomos are an excellent choice for a light snack or appetizer but can also be enjoyed as a main dish. Their popularity stems from their simplicity, yet their flavors are rich and satisfying, making them a must-have on any menu, especially for those looking for a quick, flavorful bite on the Food Dash app.",
    "price": "250"
  },
  {
    "image": "assets/images/popular_foods/Sushi.png",
    "name": "Sushi Platter",
    "description":
    "Sushi is a quintessential Japanese dish, celebrated for its balance of fresh ingredients and elegant presentation. It typically consists of vinegared rice, raw or cooked seafood (such as tuna, salmon, or shrimp), and vegetables, all carefully rolled or layered together. Sushi comes in many forms, such as maki (rolls), nigiri (fish slices on rice), and sashimi (sliced raw fish served without rice), offering something for every palate.\nThe dish is often accompanied by soy sauce, pickled ginger, and wasabi, which add savory, tangy, and spicy elements that enhance the natural flavors of the fresh ingredients. Sushi is not only known for its taste but also for its health benefits, being a low-fat, high-protein dish that incorporates omega-3-rich fish and vegetables.\n\nSushi is a versatile dish suitable for any occasion, whether it's a light lunch, a fancy dinner, or even a party platter. Its delicate flavors and artful presentation make it a premium offering on the Food Dash app, appealing to those who enjoy fresh, healthy, and visually stunning cuisine.",
    "price": "600"
  },
];
// Make foodItem nullable
  final int pageId;

  PopularFoodDetails({super.key, required this.pageId});
 
  @override
  _PopularFoodDetailsState createState() => _PopularFoodDetailsState();
}

class _PopularFoodDetailsState extends State<PopularFoodDetails> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    final foodItem = widget.SlidefoodItems[widget.pageId];
    final image = foodItem['image']; // Default image
    final name = foodItem['name'];
    final description = foodItem['description'];
    final price = foodItem['price'];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _buildBackgroundImage(image!),
          _buildAppBar(context),
          _buildFoodDetailsContainer(name!, description!),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(name, price!),
    );
  }

  Positioned _buildBackgroundImage(String image) {
    return Positioned(
      left: 0,
      right: 0,
      child: Container(
        width: double.infinity,
        height: Dimension.popularImageSize250,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }

  Positioned _buildAppBar(BuildContext context) {
    return Positioned(
      top: Dimension.height52,
      left: Dimension.width20,
      right: Dimension.width20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const AppIcon(icon: Icons.arrow_back_ios),
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => const Mycart_Page());
            },
            child: const AppIcon(icon: Icons.shopping_cart_outlined),
          ),
        ],
      ),
    );
  }

  Positioned _buildFoodDetailsContainer(String name, String description) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      top: Dimension.popularImageSize250 - 25,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: Dimension.height20,
          horizontal: Dimension.width20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(Dimension.radius20),
            topLeft: Radius.circular(Dimension.radius20),
          ),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppColumnSpacebetween(text: name),
            SizedBox(height: Dimension.height30),
            const BigText(text: "Introduce"),
            SizedBox(height: Dimension.height20),
            Expanded(
              child: SingleChildScrollView(
                child: ExpandableText(text: description),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildBottomNavigationBar(String name, String price) {
    return Container(
      height: Dimension.bottomNavigationBar120,
      padding: EdgeInsets.symmetric(
        vertical: Dimension.height30,
        horizontal: Dimension.width20,
      ),
      decoration: BoxDecoration(
        color: AppColor.buttonBackendColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(Dimension.radius20 * 2),
          topLeft: Radius.circular(Dimension.radius20 * 2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildQuantityControl(),
          _buildAddToCartButton(name, price),
        ],
      ),
    );
  }

  Container _buildQuantityControl() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Dimension.height20,
        horizontal: Dimension.width20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimension.radius20),
        color: Colors.white,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (_quantity > 1) {
                setState(() {
                  _quantity--;
                });
              }
            },
            child: const Icon(Icons.remove, color: AppColor.signColor),
          ),
          SizedBox(width: Dimension.width10),
          BigText(text: _quantity.toString()),
          SizedBox(width: Dimension.width10),
          GestureDetector(
            onTap: () {
              setState(() {
                _quantity++;
              });
            },
            child: const Icon(Icons.add, color: AppColor.signColor),
          ),
        ],
      ),
    );
  }

  Container _buildAddToCartButton(String name, String price) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Dimension.height20,
        horizontal: Dimension.width20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimension.radius20),
        color: AppColor.mainColor,
      ),
      child: GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('$name has been added to your cart!'),
              duration: const Duration(seconds: 2),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.green,
            ),
          );
        },
        child: BigText(
          text: "$price tk | Add to Cart",
          color: Colors.white,
        ),
      ),
    );
  }
}
