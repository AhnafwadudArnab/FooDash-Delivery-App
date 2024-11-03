import 'package:flutter/material.dart';
import 'package:fooduu/Pages/Utility/SideXbar/Favourite_page.dart';
import 'package:fooduu/Pages/Utility/Sidebarx.dart';
import 'package:get/get.dart';
import 'package:sidebarx/sidebarx.dart';
import '../../Widgets/Big_text.dart';
import '../../Widgets/small_text.dart';
import '../../utils/colors.dart';
import '../Food_pages/Main_Food_page_body.dart';
import '../Utility/SideXbar/newCArtPg.dart';
import '../OnBoards/Onboard.dart';
import '../Downbar/ProfileBar/Profilebar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

const primaryColor = Colors.white38; // Icon color
const canvasColor = Color(0xFF8f837f); // Background color

class _MyHomePageState extends State<MyHomePage> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 973.33;

    return Scaffold(
      key: _key,
      appBar: isSmallScreen
          ? AppBar(
              leading: IconButton(
                onPressed: () {
                  _key.currentState?.openDrawer();
                },
                icon: const Icon(Icons.menu_outlined),
              ),
              title: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BigText(
                    text: "Bangladesh",
                    color: AppColor.mainColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmallText(
                        text: "Dhaka",
                        color: Colors.black54,
                      ),
                      Icon(Icons.arrow_drop_down_rounded),
                    ],
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () {
                    Get.to(() => const FavouritesScreen());
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.shopping_cart_outlined),
                  onPressed: () {
                    Get.to(() => const Mycart_Page());
                  },
                ),
              ],
            )
          : null,
      drawer: SideBarXExample(controller: _controller),
      body: Row(
        children: [
          if (!isSmallScreen) SideBarXExample(controller: _controller),
          Expanded(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return _buildSelectedPage(_controller.selectedIndex);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to handle page selection in the sidebar
  Widget _buildSelectedPage(int selectedIndex) {
    try {
      return switch (selectedIndex) {
        0 => const CustomBottomNavigationBar(), // Main Navigation with Bottom Bar
        1 => const RecommendedFood(pageId: 1), // Recommended Food Page
        2 => const PopularFoodDetails(foodId: 0), // Popular Food Details
        3 => Center(
            child: Text(
              'Theme Settings',
              style: TextStyle(color: Colors.black12, fontSize: 40),
            ),
          ),
        _ => const Onboard() // Default Onboard page
      };
    } catch (e) {
      return Center(
        child: Text(
          'An error occurred: $e',
          style: TextStyle(color: Colors.red),
        ),
      );
    }
  }
}

// Custom bottom navigation bar with page preservation
class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;

  // List of pages for bottom navigation
  final List<Widget> _pages = [
    const main_food_page(), // Home page (set to the main food page)
    const Mycart_Page(), // Cart page
    const ProfilePage(), // Profile page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Change the current page index
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.black45,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
            backgroundColor: Colors.black45,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
            backgroundColor: Colors.black45,
          ),
        ],
      ),
    );
  }
}

// RecommendedFood widget with error handling
class RecommendedFood extends StatelessWidget {
  final int pageId;
  const RecommendedFood({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      // Implement actual UI and logic for RecommendedFood based on pageId
      return Center(child: Text('Recommended Food Page for item ID $pageId'));
    } catch (e) {
      return Center(
        child: Text(
          'An error occurred: $e',
          style: TextStyle(color: Colors.red),
        ),
      );
    }
  }
}
// PopularFoodDetails widget with error handling
class PopularFoodDetails extends StatelessWidget {
  final int foodId;

  const PopularFoodDetails({Key? key, required this.foodId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      // Implement actual UI and logic for PopularFoodDetails based on foodId
      return Center(child: Text('Popular Food Details for food ID ${foodId ?? 'unknown'}'));
    } catch (e) {
      return Center(
        child: Text(
          'An error occurred: $e',
          style: TextStyle(color: Colors.red),
        ),
      );
    }
  }
}
