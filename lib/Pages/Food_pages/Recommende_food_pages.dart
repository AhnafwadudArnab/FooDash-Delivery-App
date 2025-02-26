import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Routes/routess.dart';
import '../../Widgets/Big_text.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../Utility/SideXbar/newCArtPg.dart';
List<Map<String, String>> listfoodItems = [
  {
    "image": "assets/images/bestfood/ic_best_food_1.jpeg",
    "name": "Biryani",
    "price":"240tk",
    "description": "Biryani is a rich and aromatic rice dish that has captivated the palates of food enthusiasts across the globe. Originating from the Indian subcontinent, biryani is celebrated for its complex flavors and vibrant colors. The dish typically features basmati rice, known for its long grains and fragrant aroma, which is cooked with a blend of spices including saffron, cardamom, cloves, and cinnamon. The key to a great biryani is the layering technique, where the partially cooked rice is layered with marinated meat or vegetables, and then slow-cooked together to allow the flavors to meld beautifully. Meat options often include chicken, lamb, or beef, marinated in yogurt and a mix of spices to tenderize and infuse it with flavor. For a vegetarian version, an assortment of vegetables like potatoes, carrots, and peas is used, combined with paneer or tofu for added protein. The biryani is often garnished with fried onions, fresh cilantro, and a sprinkle of rose water or kewra water to enhance its aroma. Served with raita, a cooling yogurt-based side dish, and salad, biryani is a feast for both the eyes and the taste buds. Its preparation is a labor of love, involving meticulous steps to ensure that each grain of rice is perfectly cooked and each layer is infused with the rich spices, making it a truly special dish for celebrations and family gatherings."
  },
  {
    "image": "assets/images/bestfood/ic_best_food_2.jpeg",
    "name": "Avocado Chicken Salad",
    "price":"140tk",
    "description": "Avocado Chicken Salad is a refreshing and nutritious dish that combines the creamy richness of ripe avocados with tender, grilled chicken and a medley of fresh vegetables. This salad is not only delicious but also packed with nutrients, making it a perfect choice for a light lunch or a healthy dinner. The base of the salad features grilled chicken breast, seasoned with herbs and spices to enhance its flavor. The chicken is sliced into bite-sized pieces and mixed with ripe avocado chunks, which add a creamy texture and a dose of healthy fats. The salad also includes a variety of crisp vegetables such as cherry tomatoes, cucumbers, and red onions, which provide crunch and freshness. A light dressing, often made with a combination of olive oil, lemon juice, Dijon mustard, and a touch of honey, is drizzled over the salad to bring all the flavors together. Fresh herbs like cilantro or basil can be added for extra flavor. This salad is versatile and can be customized with additional ingredients such as nuts, seeds, or cheese. It is ideal for those seeking a balanced meal that is both satisfying and low in carbohydrates. The Avocado Chicken Salad is also a great option for meal prep, as it can be prepared in advance and enjoyed throughout the week."
  },
  {
    "image": "assets/images/bestfood/ic_best_food_3.jpeg",
    "name": "Spinach and Crab Stuffed Salmon with Lemon Cream Sauce",
    "price":"280tk",
    "description": "Spinach and Crab Stuffed Salmon with Lemon Cream Sauce is a luxurious and sophisticated dish that combines the delicate flavors of salmon with a rich and savory stuffing made from spinach and crab. This recipe is perfect for special occasions or a gourmet dinner at home. The salmon fillets are carefully deboned and pounded to create a pocket for the stuffing. The stuffing is made by sautéing fresh spinach with garlic and onions until wilted, and then mixing it with sweet crab meat. A touch of cream cheese and Parmesan cheese is added to the mixture to create a creamy and flavorful filling. The stuffed salmon is then baked until the fish is tender and flaky, and the stuffing is warm and melted. To complement the dish, a lemon cream sauce is prepared by combining heavy cream, lemon juice, and zest with a touch of white wine and chicken broth. The sauce is simmered until it thickens and is then drizzled over the stuffed salmon before serving. This dish is often garnished with fresh herbs like dill or parsley and served with a side of roasted vegetables or a light salad. The combination of the rich salmon, flavorful stuffing, and zesty lemon sauce makes for a truly memorable meal that is both elegant and indulgent."
  },
  {
    "image": "assets/images/bestfood/ic_best_food_4.jpeg",
    "name": "Char Siu (Chinese BBQ Pork)",
    "price":"320tk",
    "description": "Char Siu, also known as Chinese BBQ Pork, is a beloved dish in Cantonese cuisine that features tender, juicy pork marinated in a sweet and savory sauce and then roasted to perfection. The key to a great Char Siu is the marinade, which typically includes hoisin sauce, soy sauce, honey, and five-spice powder. The pork, usually pork shoulder or loin, is cut into long strips and marinated in the sauce for several hours to allow the flavors to penetrate the meat. It is then roasted in an oven or on a grill, occasionally basting with the remaining marinade, until the exterior is caramelized and slightly charred while the inside remains moist and flavorful. The result is a deliciously glazed pork with a balance of sweet and salty flavors and a smoky aroma. Char Siu is often served sliced over steamed rice, in noodles, or as a component in various dim sum dishes. It can also be enjoyed in sandwiches or as part of a larger Chinese banquet. The dish is popular for its distinctive red color, which comes from the use of red fermented bean curd or food coloring in the marinade, and its irresistible combination of flavors and textures."
  },
  {
    "image": "assets/images/bestfood/ic_best_food_5.jpeg",
    "name": "Cheesy BBQ Chicken Pizza",
    "price":"550tk",
    "description": "Cheesy BBQ Chicken Pizza is a mouthwatering twist on the classic pizza that combines the tangy flavors of barbecue sauce with the gooey goodness of melted cheese and tender chunks of chicken. This pizza starts with a base of pizza dough, which is spread with a layer of barbecue sauce instead of traditional tomato sauce. The sauce is often a blend of sweet and tangy flavors, made with ingredients like molasses, vinegar, and spices. On top of the sauce, a generous layer of shredded mozzarella cheese is added, followed by chunks of cooked chicken that have been seasoned and grilled. Additional toppings such as red onions, cilantro, or even bacon can be added for extra flavor and texture. The pizza is then baked in a hot oven until the crust is crispy and golden, and the cheese is melted and bubbly. Once out of the oven, the pizza can be garnished with a drizzle of more barbecue sauce and a sprinkle of fresh herbs. This dish is perfect for casual gatherings or family dinners, offering a delightful combination of smoky, savory, and cheesy flavors that are sure to please pizza lovers of all ages."
  },
  {
    "image": "assets/images/bestfood/ic_best_food_6.jpeg",
    "name": "Tandoori Paneer Tikka",
    "price":"130tk",
    "description": "Tandoori Paneer Tikka is a popular Indian appetizer that features chunks of paneer, a type of Indian cheese, marinated in a spiced yogurt mixture and then grilled or baked until charred and smoky. The marinade is made from a blend of yogurt, spices such as cumin, coriander, turmeric, and garam masala, and a touch of lemon juice. The yogurt helps to tenderize the paneer while the spices infuse it with a rich, complex flavor. The paneer cubes are marinated for several hours to ensure they absorb all the flavors of the spices. They are then skewered and cooked in a tandoor oven, which imparts a smoky flavor and crispy exterior. If a tandoor is not available, the paneer can be grilled or baked in a conventional oven. Tandoori Paneer Tikka is typically served with a side of mint chutney or tamarind sauce and garnished with fresh cilantro and lemon wedges. It is a popular choice for parties and gatherings, offering a delicious and satisfying vegetarian option that is both flavorful and easy to prepare."
  },
  {
    "image": "assets/images/bestfood/ic_best_food_7.jpeg",
    "name": "Chicken Tacos",
    "price":"270tk",
    "description": "Chicken Tacos are a versatile and flavorful dish that features seasoned chicken served in soft or crispy taco shells. The chicken is typically marinated in a blend of spices such as cumin, chili powder, paprika, and garlic, and then grilled or sautéed until cooked through. The seasoned chicken is then shredded or chopped and placed in taco shells, which can be either soft flour tortillas or crispy corn tortillas, depending on your preference. Toppings for chicken tacos can include a variety of fresh ingredients such as shredded lettuce, diced tomatoes, chopped onions, and sliced jalapeños for a bit of heat. Additional toppings like shredded cheese, sour cream, and guacamole can be added for extra flavor and creaminess. The tacos are often garnished with fresh cilantro and a squeeze of lime juice to brighten up the flavors. Chicken Tacos are perfect for casual meals and gatherings, offering a customizable and delicious option that can be tailored to suit individual tastes and dietary preferences."
  },
  {
    "image": "assets/images/bestfood/ic_best_food_8.jpeg",
    "name": "Indian Veg Meals",
    "price":"120tk",
    "description": "Indian Veg Meals are a diverse and flavorful selection of vegetarian dishes from the rich and varied culinary traditions of India. These meals often include a variety of dishes, each with its own unique flavors and ingredients. Common components of an Indian veg meal might include a variety of curries made with vegetables such as potatoes, peas, and cauliflower, as well as lentil dishes like dal, which are both nutritious and hearty. The meals are typically accompanied by rice or Indian breads such as chapati, naan, or paratha. Each dish is carefully spiced with a blend of aromatic spices like turmeric, cumin, coriander, and garam masala, which enhance the natural flavors of the ingredients and create a complex and satisfying meal. Indian Veg Meals often include a side of cooling yogurt or raita, which helps to balance the heat of the spices. These meals can also feature a variety of pickles, chutneys, and salads that add freshness and contrast to the rich and spicy dishes. Indian Veg Meals are not only delicious but also offer a healthy and balanced option for those who enjoy a vegetarian diet."
  },
  {
    "image": "assets/images/bestfood/ic_best_food_9.jpeg",
    "name": "Chicken Caesar Wrap",
    "price":"190tk",
    "description": "The Chicken Caesar Wrap is a delicious and convenient take on the classic Caesar salad. This wrap features tender, grilled chicken breast slices, which are seasoned and cooked to perfection, providing a satisfying source of protein. The chicken is paired with crisp romaine lettuce, which adds a fresh and crunchy texture. Shredded Parmesan cheese is sprinkled throughout, contributing a rich, nutty flavor that complements the chicken and lettuce. The wrap is dressed with Caesar dressing, a creamy and tangy mixture made from mayonnaise, garlic, anchovies, and lemon juice, which ties all the ingredients together. The dressing is often drizzled over the salad before it is wrapped in a soft tortilla, making it easy to enjoy on the go. Additional ingredients such as croutons or bacon bits can be added for extra crunch and flavor. The Chicken Caesar Wrap is a versatile meal that can be enjoyed for lunch, dinner, or as a quick snack. Its combination of hearty chicken, crisp vegetables, and flavorful dressing makes it a satisfying and enjoyable option for any time of day."
  },
  {
    "image": "assets/images/bestfood/ic_best_food_10.jpeg",
    "name": "Black Pepper Stir Fried Udon",
    "price":"150tk",
    "description": "Black Pepper Stir Fried Udon is a savory and satisfying dish that features thick, chewy udon noodles stir-fried with a medley of vegetables and a flavorful black pepper sauce. Udon noodles, known for their smooth and hearty texture, are the star of this dish, providing a comforting base. The noodles are stir-fried with a combination of vegetables, such as bell peppers, carrots, and snap peas, adding color and crunch. The black pepper sauce, made from a blend of soy sauce, black pepper, and other seasonings, coats the noodles and vegetables, creating a bold and spicy flavor profile. Protein options such as chicken, beef, or tofu can be added to the dish, making it a complete and filling meal. The stir-frying process ensures that the noodles and vegetables retain their texture while absorbing the flavors of the sauce. Black Pepper Stir Fried Udon is a versatile dish that can be enjoyed as a main course or a side dish, and it is perfect for those who enjoy a spicy and savory meal with a satisfying noodle base."
  },
  {
    "image": "assets/images/bestfood/ic_best_food_60.jpeg",
    "name": "Meatballs and Spaghetti",
    "price":"210tk",
    "description": "Meatballs and Spaghetti is a classic Italian dish that combines tender, flavorful meatballs with a bed of perfectly cooked spaghetti, all topped with a rich and savory marinara sauce. The meatballs are made from a mixture of ground beef and pork, seasoned with herbs such as parsley, basil, and oregano, and combined with breadcrumbs and eggs for a light and tender texture. They are baked or pan-fried until they are golden brown and cooked through. The marinara sauce, made from tomatoes, garlic, onions, and a blend of Italian spices, is simmered to develop a deep, robust flavor. The sauce is generously poured over the meatballs and spaghetti, creating a comforting and satisfying meal. The spaghetti is cooked al dente, ensuring that it retains a slight bite and pairs well with the sauce. Meatballs and Spaghetti is often served with a sprinkle of Parmesan cheese and a side of garlic bread, making it a classic and beloved dish in Italian cuisine. It is perfect for family dinners or casual gatherings, offering a hearty and flavorful meal that is sure to please."
  },
];
class RecommendedFood extends StatefulWidget {
  final int pageId;
  const RecommendedFood({super.key, required this.pageId});

  @override
  _RecommendedFoodState createState() => _RecommendedFoodState();
}

class _RecommendedFoodState extends State<RecommendedFood> {
  int _quantity = 1; // Define the quantity state variable

  @override
  Widget build(BuildContext context) {
    var foodItem = listfoodItems[widget.pageId];

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RoutesHelper.getInitial());
                  },
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.clear,
                      color: Colors.white,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.shopping_cart_outlined),
                  onPressed: () {
                    Get.to( const Mycart_Page());
                  },
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                margin: EdgeInsets.only(
                  left: Dimension.width20,
                  right: Dimension.width20,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimension.radius20),
                    topRight: Radius.circular(Dimension.radius20),
                  ),
                ),
                width: double.infinity,
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: Center(
                  child: BigText(
                    size: Dimension.font26,
                    text: foodItem['name']!,
                  ),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColor.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                foodItem['image']!,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(
                left: Dimension.width20,
                right: Dimension.width20,
              ),
              child: Text(
                foodItem['description']!,
                style: TextStyle(
                  fontSize: Dimension.font17,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimension.width20 * 2.5,
              right: Dimension.width20 * 2.5,
              top: Dimension.height10,
              bottom: Dimension.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildQuantityControl(),
                _buildAddToCartButton(foodItem),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityControl() {
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
                  _quantity--; // Decrement quantity
                });
              }
            },
            child: const Icon(Icons.remove, color: AppColor.signColor),
          ),
          SizedBox(width: Dimension.width10),
          BigText(text: _quantity.toString()), // Show quantity
          SizedBox(width: Dimension.width10),
          GestureDetector(
            onTap: () {
              setState(() {
                _quantity++; // Increment quantity
              });
            },
            child: const Icon(Icons.add, color: AppColor.signColor),
          ),
        ],
      ),
    );
  }

  Widget _buildAddToCartButton(Map<String, String> foodItem) {
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
              content: Text('${foodItem['name']} has been added to your cart!'),
              duration: const Duration(seconds: 2),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.green,
            ),
          );
        },
        child: BigText(
          text: "${foodItem['price']} | Add to Cart",
          color: Colors.white,
        ),
      ),
    );
  }
}
