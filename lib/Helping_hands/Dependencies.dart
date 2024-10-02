
import 'package:get/get.dart';

import '../Datas/API/api_clients.dart';
import '../Datas/Controllers/PopularProducts_controllers.dart';
import '../Datas/Repository/Popular_products_repo.dart';
import 'Theme_controllers.dart';

Future <void> init() async{
  Get.lazyPut(()=>ApiClient(appBaseUrl: "http://mvs.bslmeiyu.com"));
  Get.lazyPut(()=>PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(()=>PopularProductController(popularProductRepo: Get.find()));
  Get.put(ThemeController());

}