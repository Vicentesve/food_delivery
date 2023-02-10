import 'package:get/get.dart';
import '../data/repository/popular_product_repo.dart';
import '../models/popular_product_model.dart';

class PopularProductController extends GetxController {
  final PopularProuctRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products!);

      update();
    } else {}
  }
}