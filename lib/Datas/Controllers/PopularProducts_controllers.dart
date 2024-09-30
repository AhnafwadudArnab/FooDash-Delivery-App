import 'package:FooDash_App/Models/product_models.dart';
import 'package:get/get.dart';

import '../../Models/product_models.dart';
import '../../Models/product_models.dart';
import '../Repository/Popular_products_repo.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> popularProductList = [];
  List<dynamic>get PopularProductList =>popularProductList;
  bool _isLoaded =false;
  bool get isLoaded => _isLoaded;
  int _quantity = 0;
  int get quantity => _quantity;

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity++;
    } else {
      if (_quantity > 1) {
        _quantity--;
      }
    }
    update(); // Updates the UI
  }
  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductRepo();

    if (response.statusCode == 200) {
      print("got products");
      popularProductList=[];
      popularProductList.addAll(PopularFoodModels.fromJson(response.body) as Iterable);
      _isLoaded=true;
      update();
      print(popularProductList);
    } else {
      // Handle the error
      print('Failed to load popular products: ${response.statusText}');
    }
  }
}