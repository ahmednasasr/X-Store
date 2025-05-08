import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_store/features/auth/presentation/manager/state.dart';

import '../../domain/use_case/login_use_case.dart';
import '../../domain/use_case/sign_up_use_case.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(InitState());

  static AuthCubit get(context) => BlocProvider.of(context);

  LoginUseCase loginUseCase = LoginUseCase();
  SignUpUseCase signUpUseCase = SignUpUseCase();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Future<void> login() async {
    emit(LoginLoadingState());
    try {
      await loginUseCase.call(
          email: emailController.text, password: passwordController.text);
      emit(LoginSuccessState());
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }

  Future<void> signUp() async {
    emit(SignUpLoadingState());
    try {
      await signUpUseCase.call(
          email: emailController.text,
          password: passwordController.text,
          name: nameController.text,
          phone: phoneController.text,
          rePassword: rePasswordController.text);
      emit(SignUpSuccessState());
    } catch (e) {
      emit(SignUpErrorState(e.toString()));
    }
  }
}
