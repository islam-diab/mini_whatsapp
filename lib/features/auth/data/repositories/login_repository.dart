import 'package:mini_whatsapp/core/helper/function.dart';
import 'package:mini_whatsapp/core/model/api_result.dart';
import 'package:mini_whatsapp/features/auth/data/data_sources/data_source.dart';

class LoginRepository {
  final DataSource dataSource;
  LoginRepository({required this.dataSource});
  Future<ApiResult> login(String email, String password) async {
    if (await isConnectedNetwork()) {
      ApiResult result = await dataSource.login(email, password);
      return ApiResult(value: result, isError: false);
    } else {
      return ApiResult(value: 'No internet connection', isError: true);
    }
  }
}
