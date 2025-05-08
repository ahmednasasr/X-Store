import '../../data/models/auth_model.dart';
import '../../data/repo/repo_imp.dart';
import '../repo/repo.dart';

class LoginUseCase {
  AuthRepo authRepo = AuthRepoImp();
  Future<AuthModel> call(
      {required String email, required String password}) async {
    return await authRepo.login(email: email, password: password);
  }
}
