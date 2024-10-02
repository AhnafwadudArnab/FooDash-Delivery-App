import 'package:get/get.dart';

import '../API/api_clients.dart';
class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductRepo() async {
    return await apiClient.getData("/api/v1/products/popular");
  }
}