import 'package:FooDash_App/Pages/Home_pages/Utility/SideXbar/Darkmode_page.dart';
import 'package:FooDash_App/Pages/Home_pages/Utility/SideXbar/Favourite_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sidebarx/sidebarx.dart';
import '../../Widgets/Big_text.dart';
import '../../Widgets/small_text.dart';
import '../../utils/colors.dart';
import '../Food_pages/Recommende_food_pages.dart';
import '../Food_pages/Main_Food_page_body.dart';
import '../Home_pages/Utility/Sidebarx.dart';
import '../OnBoards/Onboard.dart';
import '../cart/Cart.dart';
import 'Profilebar.dart';
class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

const primaryColor = Colors.white38; // icon color
const canvasColor = Color(0xFF8f837f); // background

class _MyHomePageState extends State<MyHomePage> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();
  late TabController _tabController;
  @override
  void initState(){
    super.initState();
    //_tabController = TabController(length: FoodCatagory.values.length, vsync: this);
  }
  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }
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
              color: AppColor.mainColor, // Assuming `AppColor.mainColor` is defined
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
              Get.offAll(()=> FavouritesScreen());
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              Get.to(() => const CartPage());

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
                switch (_controller.selectedIndex) {
                  case 0:
                    return const CustomBottomNavigationBar(); // Main Navigation with Bottom Bar
                  case 1:
                    return RecommendedFood(pageId: 1,); // Recommended Food Page
                  case 2:
                    return  RecommendedFood(pageId: 0,); // Popular Food Details
                  case 3:
                    return const Center(
                      child: Text(
                        'Theme Settings',
                        style: TextStyle(color: Colors.black12, fontSize: 40),
                      ),
                    );
                  default:
                    return const Onboard();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

//custom navi//
class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState
    extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;

  // List of pages for bottom navigation
  final List<Widget> _pages = [
   const main_food_page(), // Home page (set to the main food page)
    const CartPage(),
    const ProfilePage(),
    Mode_page()// Include sidebar page here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack( // Use IndexedStack to preserve page state
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
              icon: Icon(Icons.home), label: "Home", backgroundColor: Colors.black45), // Home button
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart", backgroundColor: Colors.black45), // Cart button
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Profile", backgroundColor: Colors.black45), // Profile button
        ],
      ),
    );
  }
}
