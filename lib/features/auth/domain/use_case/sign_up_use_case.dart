import '../../data/models/auth_model.dart';
import '../../data/repo/repo_imp.dart';
import '../repo/repo.dart';

class SignUpUseCase {
  AuthRepo authRepo = AuthRepoImp();
  Future<AuthModel> call(
      {required String email,
      required String password,
      required String name,
      required String phone,
      required String rePassword}) async {
    return await authRepo.signUp(
        email: email,
        password: password,
        name: name,
        phone: phone,
        rePassword: rePassword);
  }
}
