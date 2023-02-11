import 'package:food_delivery/data/repository/recommended_product_repo.dart';
import 'package:get/get.dart';
import '../models/popular_product_model.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProuctRepo recommendedProductRepo;

  RecommendedProductController({required this.recommendedProductRepo});

  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;

  bool _isLoading = true;
  bool get isLoading2 => _isLoading;

  Future<void> getRecommendedProductList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products!);

      _isLoading = false;
      update();
    } else {}
  }
}
