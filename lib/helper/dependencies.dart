import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import '../controllers/popular_product_controller.dart';
import '../data/repository/popular_product_repo.dart';

Future<void> init() async {
  //Api Clieny
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  // Repository
  Get.lazyPut(() => PopularProuctRepo(apiClient: Get.find()));

  // Controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
