import 'package:mini_whatsapp/core/helper/function.dart';
import 'package:mini_whatsapp/core/model/api_result.dart';
import 'package:mini_whatsapp/features/chats/data/chats_data_source.dart';

class ChatsRepository {
  final ChatsDataSource homeDataSource;
  ChatsRepository({required this.homeDataSource});

  Future<ApiResult> getChatsInfo(String roomId) async {
    if (await isConnectedNetwork()) {
      ApiResult result = await homeDataSource.getChatsInfo(roomId);
      return result;
    } else {
      return ApiResult(value: 'No internet connection', isError: true);
    }
  }
}
