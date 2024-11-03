import 'Food.dart';
class Resturant{
   // ignore: unused_field
   final List <FoOd>_menu=[
    //popular food tab
    FoOd(
      name: 'Biryani',
      discriptions: "Biryani is a rich and aromatic rice dish that has captivated the palates of food enthusiasts across the globe...",
      imagePath: "assets/images/bestfood/ic_best_food_1.jpeg",
      price: 240,
      catagory: FoodCatagory.Polular,
      availableAddons: [
        Addon(name: "Extra meat", price: 80),
        Addon(name: "Raita", price: 20),
      ],
    ),

    FoOd(
      name: 'Avocado Chicken Salad',
      discriptions: "Avocado Chicken Salad is a refreshing and nutritious dish that combines the creamy richness of ripe avocados with tender, grilled chicken and fresh vegetables...",
      imagePath: "assets/images/bestfood/ic_best_food_2.jpeg",
      price: 140,
      catagory: FoodCatagory.Polular,
      availableAddons: [
        Addon(name: "Extra avocado", price: 50),
        Addon(name: "Croutons", price: 30),
      ],
    ),

    FoOd(
      name: 'Spinach and Crab Stuffed Salmon with Lemon Cream Sauce',
      discriptions: "Spinach and Crab Stuffed Salmon with Lemon Cream Sauce is a luxurious dish that combines delicate salmon with a rich stuffing made from spinach and crab...",
      imagePath: "assets/images/bestfood/ic_best_food_3.jpeg",
      price: 280,
      catagory: FoodCatagory.Polular,
      availableAddons: [
        Addon(name: "Extra crab stuffing", price: 100),
        Addon(name: "Lemon wedges", price: 10),
      ],
    ),

    FoOd(
      name: 'Char Siu (Chinese BBQ Pork)',
      discriptions: "Char Siu, also known as Chinese BBQ Pork, is a beloved dish in Cantonese cuisine, featuring tender, juicy pork marinated in a sweet and savory sauce...",
      imagePath: "assets/images/bestfood/ic_best_food_4.jpeg",
      price: 320,
      catagory: FoodCatagory.Polular,
      availableAddons: [
        Addon(name: "Extra pork", price: 120),
        Addon(name: "Steamed rice", price: 50),
      ],
    ),

    FoOd(
      name: 'Cheesy BBQ Chicken Pizza',
      discriptions: "Cheesy BBQ Chicken Pizza is a mouthwatering twist on the classic pizza that combines tangy BBQ sauce with gooey cheese and tender chicken chunks...",
      imagePath: "assets/images/bestfood/ic_best_food_5.jpeg",
      price: 550,
      catagory: FoodCatagory.Polular,
      availableAddons: [
        Addon(name: "Extra cheese", price: 70),
        Addon(name: "Bacon", price: 100),
      ],
    ),

    FoOd(
      name: 'Tandoori Paneer Tikka',
      discriptions: "Tandoori Paneer Tikka is a popular Indian appetizer that features chunks of paneer marinated in spiced yogurt and grilled until charred and smoky...",
      imagePath: "assets/images/bestfood/ic_best_food_6.jpeg",
      price: 130,
      catagory: FoodCatagory.Polular,
      availableAddons: [
        Addon(name: "Extra paneer", price: 60),
        Addon(name: "Mint chutney", price: 20),
      ],
    ),

    FoOd(
      name: 'Chicken Tacos',
      discriptions: "Chicken Tacos are a versatile and flavorful dish featuring seasoned chicken served in soft or crispy taco shells, garnished with fresh toppings...",
      imagePath: "assets/images/bestfood/ic_best_food_7.jpeg",
      price: 270,
      catagory: FoodCatagory.Polular,
      availableAddons: [
        Addon(name: "Extra chicken", price: 80),
        Addon(name: "Guacamole", price: 50),
      ],
    ),

    FoOd(
      name: 'Indian Veg Meals',
      discriptions: "Indian Veg Meals are a diverse and flavorful selection of vegetarian dishes that include curries, lentils, and rice or Indian breads like chapati or naan...",
      imagePath: "assets/images/bestfood/ic_best_food_8.jpeg",
      price: 120,
      catagory: FoodCatagory.Polular,
      availableAddons: [
        Addon(name: "Extra curry", price: 40),
        Addon(name: "Chapati", price: 20),
      ],
    ),

    FoOd(
      name: 'Chicken Caesar Wrap',
      discriptions: "The Chicken Caesar Wrap is a delicious and convenient version of the classic Caesar salad, featuring grilled chicken, romaine lettuce, and Caesar dressing wrapped in a soft tortilla...",
      imagePath: "assets/images/bestfood/ic_best_food_9.jpeg",
      price: 190,
      catagory: FoodCatagory.Polular,
      availableAddons: [
        Addon(name: "Bacon", price: 50),
        Addon(name: "Extra dressing", price: 30),
      ],
    ),

    FoOd(
      name: 'Black Pepper Stir Fried Udon',
      discriptions: "Black Pepper Stir Fried Udon features thick, chewy udon noodles stir-fried with vegetables and a savory black pepper sauce...",
      imagePath: "assets/images/bestfood/ic_best_food_10.jpeg",
      price: 150,
      catagory: FoodCatagory.Polular,
      availableAddons: [
        Addon(name: "Extra noodles", price: 60),
        Addon(name: "Chicken", price: 80),
      ],
    ),

    FoOd(
      name: 'Meatballs and Spaghetti',
      discriptions: "Meatballs and Spaghetti is a classic Italian dish featuring tender meatballs served over a bed of spaghetti with marinara sauce...",
      imagePath: "assets/images/bestfood/ic_best_food_60.jpeg",
      price: 210,
      catagory: FoodCatagory.Polular,
      availableAddons: [
        Addon(name: "Extra meatballs", price: 70),
        Addon(name: "Parmesan cheese", price: 50),
      ],
    ),
       //Drinks//
    FoOd(
      name: 'Mango Lassi',
      discriptions: "Mango Lassi is a refreshing and creamy Indian yogurt-based drink blended with ripe mangoes, yogurt, and a hint of cardamom...",
      imagePath: "assets/images/bestfood/ic_best_drink_1.jpeg",
      price: 80,
      catagory: FoodCatagory.Drinks,
      availableAddons: [
        Addon(name: "Extra mango", price: 20),
        Addon(name: "Sugar-free option", price: 0),
      ],
    ),

    FoOd(
      name: 'Cold Coffee',
      discriptions: "Cold Coffee is a chilled and energizing drink made with freshly brewed coffee, milk, and ice, perfect for coffee lovers who crave a cool, caffeinated treat...",
      imagePath: "assets/images/bestfood/ic_best_drink_2.jpeg",
      price: 100,
      catagory: FoodCatagory.Drinks,
      availableAddons: [
        Addon(name: "Extra shot of espresso", price: 30),
        Addon(name: "Whipped cream", price: 20),
      ],
    ),

    FoOd(
      name: 'Lemon Iced Tea',
      discriptions: "Lemon Iced Tea is a tangy and refreshing beverage that combines the bold flavor of black tea with a zesty twist of lemon...",
      imagePath: "assets/images/bestfood/ic_best_drink_3.jpeg",
      price: 60,
      catagory: FoodCatagory.Drinks,
      availableAddons: [
        Addon(name: "Extra lemon", price: 10),
        Addon(name: "Mint leaves", price: 10),
      ],
    ),

    FoOd(
      name: 'Strawberry Milkshake',
      discriptions: "Strawberry Milkshake is a sweet and creamy blend of fresh strawberries, milk, and ice cream, perfect for a fruity indulgence...",
      imagePath: "assets/images/bestfood/ic_best_drink_4.jpeg",
      price: 120,
      catagory: FoodCatagory.Drinks,
      availableAddons: [
        Addon(name: "Extra strawberries", price: 30),
        Addon(name: "Whipped cream", price: 20),
      ],
    ),

    FoOd(
      name: 'Fresh Lime Soda',
      discriptions: "Fresh Lime Soda is a fizzy and zesty drink made with fresh lime juice, soda, and a pinch of salt or sugar for a refreshing burst of flavor...",
      imagePath: "assets/images/bestfood/ic_best_drink_5.jpeg",
      price: 50,
      catagory: FoodCatagory.Drinks,
      availableAddons: [
        Addon(name: "Salted version", price: 0),
        Addon(name: "Sweet version", price: 0),
      ],
    ),

    FoOd(
      name: 'Orange Juice',
      discriptions: "Orange Juice is a vibrant and vitamin-packed drink made from freshly squeezed oranges, perfect for a refreshing and healthy boost...",
      imagePath: "assets/images/bestfood/ic_best_drink_6.jpeg",
      price: 70,
      catagory: FoodCatagory.Drinks,
      availableAddons: [
        Addon(name: "Extra pulp", price: 10),
        Addon(name: "Ice cubes", price: 5),
      ],
    ),

       //Burgers//
    FoOd(
      name: 'Classic Cheeseburger',
      discriptions: "The Classic Cheeseburger is a simple yet satisfying combination of a juicy beef patty, melted cheddar cheese, and fresh vegetables...",
      imagePath: "assets/ImagesFood/Burger/1.jpg",
      price: 250,
      catagory: FoodCatagory.Burger,
      availableAddons: [
        Addon(name: "Extra cheese", price: 70),
        Addon(name: "Bacon", price: 100),
        Addon(name: "Avocado", price: 50),
      ],
    ),

    FoOd(
      name: 'Double Beef Burger',
      discriptions: "The Double Beef Burger features two hearty beef patties stacked high with layers of cheddar cheese, lettuce, tomatoes, and special sauce...",
      imagePath: "assets/ImagesFood/Burger/2.jpg",
      price: 320,
      catagory: FoodCatagory.Burger,
      availableAddons: [
        Addon(name: "Extra patty", price: 120),
        Addon(name: "Jalapeños", price: 30),
        Addon(name: "Onion rings", price: 50),
      ],
    ),

    FoOd(
      name: 'Bacon BBQ Burger',
      discriptions: "The Bacon BBQ Burger is packed with flavor, featuring a juicy beef patty, crispy bacon, tangy BBQ sauce, and cheddar cheese on a soft bun...",
      imagePath: "assets/ImagesFood/Burger/bbq burger.jpg",
      price: 300,
      catagory: FoodCatagory.Burger,
      availableAddons: [
        Addon(name: "Extra BBQ sauce", price: 40),
        Addon(name: "Grilled onions", price: 30),
        Addon(name: "Extra bacon", price: 90),
      ],
    ),

    FoOd(
      name: 'Chicken Ranch Burger',
      discriptions: "The Chicken Ranch Burger is a crispy chicken fillet topped with fresh lettuce, tomatoes, and a creamy ranch dressing for a perfect bite...",
      imagePath: "assets/ImagesFood/Burger/Burgersteig Berlin.png",
      price: 220,
      catagory: FoodCatagory.Burger,
      availableAddons: [
        Addon(name: "Extra ranch dressing", price: 20),
        Addon(name: "Cheddar cheese", price: 40),
        Addon(name: "Bacon", price: 80),
      ],
    ),

    FoOd(
      name: 'Veggie Burger',
      discriptions: "The Veggie Burger is a delicious and healthy option, made with a plant-based patty, fresh vegetables, and vegan mayo on a whole wheat bun...",
      imagePath: "assets/ImagesFood/Burger/ic_best_burger_5.jpeg",
      price: 180,
      catagory: FoodCatagory.Burger,
      availableAddons: [
        Addon(name: "Vegan cheese", price: 50),
        Addon(name: "Avocado", price: 50),
        Addon(name: "Grilled mushrooms", price: 30),
      ],
    ),

    FoOd(
      name: 'Spicy Jalapeño Burger',
      discriptions: "For those who love heat, the Spicy Jalapeño Burger features a juicy beef patty topped with spicy jalapeños, pepper jack cheese, and chipotle mayo...",
      imagePath: "assets/ImagesFood/Burger/crispy chicken.png",
      price: 270,
      catagory: FoodCatagory.Burger,
      availableAddons: [
        Addon(name: "Extra jalapeños", price: 20),
        Addon(name: "Chipotle sauce", price: 25),
        Addon(name: "Pepper jack cheese", price: 60),
      ],
    ),

    FoOd(
      name: 'Mushroom Swiss Burger',
      discriptions: "The Mushroom Swiss Burger is a savory delight with sautéed mushrooms, creamy Swiss cheese, and caramelized onions over a juicy beef patty...",
      imagePath: "assets/ImagesFood/Burger/mashrupsswiss.jpeg",
      price: 290,
      catagory: FoodCatagory.Burger,
      availableAddons: [
        Addon(name: "Extra mushrooms", price: 40),
        Addon(name: "Swiss cheese", price: 50),
        Addon(name: "Truffle oil", price: 80),
      ],
    ),

    FoOd(
      name: 'Grilled Chicken Avocado Burger',
      discriptions: "The Grilled Chicken Avocado Burger features a perfectly grilled chicken breast topped with creamy avocado, lettuce, and tomato on a toasted bun...",
      imagePath: "assets/ImagesFood/Burger/images.jpeg",
      price: 260,
      catagory: FoodCatagory.Burger,
      availableAddons: [
        Addon(name: "Extra avocado", price: 50),
        Addon(name: "Provolone cheese", price: 60),
        Addon(name: "Garlic aioli", price: 40),
      ],
    ),
    /*
   Getters
    */
  //  List<FoOd> get_menu = menu;

    /*
    Operations
    //Add to  Cart
    //remove from cart//
    //get a total price of cart//
    //get a total number of items in the cart//
    //remove from the cart//
    */


    /*
    Helpers
    //genarate a recipt
    //format double value into money
    //format of list of Addons into a string summary
    */
  ];
}