import 'package:get/get.dart';

import '../model/product.dart';
import '../service/serviceController.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  List<Product> productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
