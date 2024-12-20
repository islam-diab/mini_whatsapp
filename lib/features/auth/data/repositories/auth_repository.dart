import 'package:mini_whatsapp/core/helper/function.dart';
import 'package:mini_whatsapp/core/model/api_result.dart';
import 'package:mini_whatsapp/core/model/user.dart';
import 'package:mini_whatsapp/features/auth/data/data_sources/data_source.dart';

class AuthRepository {
  final DataSource dataSource;
  AuthRepository({required this.dataSource});

  Future<ApiResult> register(UserModel user) async {
    if (await isConnectedNetwork()) {
      ApiResult result = await dataSource.register(user);
      return ApiResult(value: result, isError: false);
    } else {
      return ApiResult(value: 'No internet connection', isError: true);
    }
  }

  Future<ApiResult> login(String email, password) async {
    if (await isConnectedNetwork()) {
      ApiResult result = await dataSource.login(email, password);
      return ApiResult(value: result, isError: false);
    } else {
      return ApiResult(value: 'No internet connection', isError: true);
    }
  }
}
