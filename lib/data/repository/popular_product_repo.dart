import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

import '../api/api_client.dart';

class PopularProuctRepo extends GetxService {
  final ApiClient apiClient;

  PopularProuctRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);
  }
}
