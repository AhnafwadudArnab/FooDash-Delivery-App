import 'package:FooDash_App/Pages/Downbar/BottomNavigationButtons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import '../../../Widgets/Big_text.dart'; // Ensure this exists
import '../../../Widgets/small_text.dart'; // Ensure this exists
import '../../../utils/dimensions.dart';
import 'Cart_Controllers.dart';
import 'cartItemss.dart'; // Ensure this exists or update the path

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Page"),
        backgroundColor: Colors.amber[300],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey), // Add cart icon
            SizedBox(height: Dimension.height30),
            const BigText(text: 'Hungry?!'),
            SizedBox(height: Dimension.height20),
            const SmallText(text: 'You haven’t added anything to your cart yet!'),
            SizedBox(height: Dimension.height52),
            ElevatedButton(
              onPressed: () {
                Get.offAll(() => const MyHomePage());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                padding: EdgeInsets.symmetric(horizontal: Dimension.width30, vertical: Dimension.height15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimension.radius15),
                ),
              ),
              child: Text('Browse Food', style: TextStyle(fontSize: Dimension.font15)),
            ),
          ],
        ),
      ),
    );
  }
}

// Cart Page with GetX Controller
class CartPageContent extends StatefulWidget {
  const CartPageContent({super.key});

  @override
  _CartPageContentState createState() => _CartPageContentState();
}

class _CartPageContentState extends State<CartPageContent> {
  late CartController cartController; // GetX Controller
  final TextEditingController nametextcontroller = TextEditingController();
  final TextEditingController addresstextcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    cartController = Get.put(CartController()); // Initialize GetX Controller
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      await cartController.getDatabaseValue(); // Fetch initial data
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(left: 30.0, top: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "My Order",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 35.0),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 25.0),
                child: Divider(thickness: 2.0),
              ),
              Obx(() => createListCart()), // Reactive GetX Widget
              createTotalPriceWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget createTotalPriceWidget() {
    return Container(
      padding: const EdgeInsets.only(right: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total:",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 25.0),
              ),
              Obx(() => Text(
                "${cartController.totalPrice.value} Rs.",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 30.0),
              )),
            ],
          ),
          const Divider(thickness: 2.0),
          const SizedBox(height: 20.0),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: MediaQuery.of(context).size.width * 0.14,
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.orange),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                ),
                onPressed: () => _showDialog(),
                child: const Text(
                  "Place Order",
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget createListCart() {
    if (cartController.foodList.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: cartController.foodList.length,
        itemBuilder: (_, index) {
          return CartItems(cartController.foodList[index]);
        },
      );
    }
  }

  void _showDialog() {
    if (cartController.totalPrice.value == 0) {
      Get.snackbar('Alert', 'Your cart is empty, add some items first.');
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Place Order'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  const Text('Fill in your details'),
                  TextField(
                    controller: nametextcontroller,
                    decoration: const InputDecoration(labelText: 'Name'),
                  ),
                  TextField(
                    controller: addresstextcontroller,
                    decoration: const InputDecoration(labelText: 'Address'),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  // Validate inputs
                  if (nametextcontroller.text.isEmpty || addresstextcontroller.text.isEmpty) {
                    Get.snackbar('Error', 'Please fill in all fields.');
                  } else {
                    cartController.placeOrder(nametextcontroller.text, addresstextcontroller.text);
                    Navigator.of(context).pop(); // Close the dialog after placing the order
                  }
                },
                child: const Text('Order'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void dispose() {
    nametextcontroller.dispose();
    addresstextcontroller.dispose();
    super.dispose();
  }
}
