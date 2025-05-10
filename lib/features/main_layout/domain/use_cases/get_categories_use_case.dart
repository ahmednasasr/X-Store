import 'package:injectable/injectable.dart';
import '../../data/models/category_response.dart';
import '../repo/repo.dart';

@injectable
class GetCategoriesUseCase {
  MainRepo mainRepo;
  GetCategoriesUseCase(this.mainRepo);

  Future<List<CategoryData>> call() async {
    return await mainRepo.getAllCategory();
  }
}
