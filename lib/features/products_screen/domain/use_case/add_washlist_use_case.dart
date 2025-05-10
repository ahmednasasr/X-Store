
import 'package:injectable/injectable.dart';

import '../repo/repo.dart';

@injectable
class AddWashListUseCase {
  ProductRepo repo;
  AddWashListUseCase(this.repo);

  Future<String> call({required String id}) async {
    return await repo.addWashList(id: id);
  }
}
