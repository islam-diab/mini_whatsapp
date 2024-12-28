import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_whatsapp/features/chats/presentation/view/widget/show_all_user.dart';
import 'package:mini_whatsapp/features/chats/presentation/view/widget/user_list_view.dart';
import 'package:mini_whatsapp/features/chats/presentation/view_model/chats_cubit.dart';
part 'widget/room_bloc_builder.dart';
part 'widget/chat_floating_button.dart';

class RoomView extends StatelessWidget {
  const RoomView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          RoomBlocBuilder(
            isOnline: true,
          ),
          ChatFloatingButton(),
        ],
      ),
    );
  }
}
