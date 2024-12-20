import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_whatsapp/core/model/user.dart';
import 'package:mini_whatsapp/features/auth/data/repositories/auth_repository.dart';

part 'login_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository loginRepository;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AuthCubit(this.loginRepository) : super(AuthInitial());

  Future<void> register() async {
    emit(AuthLoading());

    UserModel user = UserModel(
        uid: DateTime.now().toString(),
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text);
    try {
      await loginRepository.register(user);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }

  Future<void> login() async {
    emit(AuthLoading());
    try {
      await loginRepository.login(
          emailController.text, passwordController.text);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }
}
