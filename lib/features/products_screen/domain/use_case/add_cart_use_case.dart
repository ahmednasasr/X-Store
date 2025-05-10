
import 'package:injectable/injectable.dart';

import '../repo/repo.dart';

@injectable
class AddCartUseCase {
  ProductRepo repo;
  AddCartUseCase(this.repo);

  Future<String> call({required String id}) async {
    return await repo.addCart(id: id);
  }
}
