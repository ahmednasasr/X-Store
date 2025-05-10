import 'package:injectable/injectable.dart';

import '../../data/models/product_response.dart';
import '../repo/repo.dart';

@injectable
class GetProductUseCase {
  ProductRepo repo;
  GetProductUseCase(this.repo);

  Future<List<ProductData>> call({String? categoryId, String? brandId}) async {
    return await repo.getProducts(categoryId: categoryId, brandId: brandId);
  }
}
