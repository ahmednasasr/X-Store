
import 'package:injectable/injectable.dart';

import '../../domain/repo/repo.dart';
import '../data_source/data_source.dart';
import '../models/product_response.dart';

@Injectable(as: ProductRepo)
class ProductRepoImp implements ProductRepo {
  ProductDataSource dataSource;
  ProductRepoImp(this.dataSource);

  @override
  Future<List<ProductData>> getProducts(
      {String? categoryId, String? brandId}) async {
    try {
      var response = await dataSource.getProducts(
          categoryId: categoryId, brandId: brandId);
      if (response.statusCode == 200) {
        var product = ProductResponse.fromJson(response.data);
        return product.products ?? [];
      } else {
        throw response.data["message"];
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> addWashList({required String id}) async {
    try {
      var response = await dataSource.addWashList(id: id);
      if (response.statusCode == 200) {
        return response.data["message"] ?? "";
      } else {
        throw response.data["message"];
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> addCart({required String id}) async {
    try {
      var response = await dataSource.addCart(id: id);
      if (response.statusCode == 200) {
        return response.data["message"] ?? "";
      } else {
        throw response.data["message"];
      }
    } catch (e) {
      rethrow;
    }
  }
}
