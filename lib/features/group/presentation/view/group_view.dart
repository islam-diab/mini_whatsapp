import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:mini_whatsapp/core/widget/app_alert_dialog.dart';
import 'package:mini_whatsapp/core/widget/app_floating_button.dart';
import 'package:mini_whatsapp/core/widget/app_text_form.dart';
import 'package:mini_whatsapp/features/chats/presentation/view/widget/chat_view.dart';
import 'package:mini_whatsapp/features/group/presentation/view/select_user.dart';
import 'package:mini_whatsapp/features/group/presentation/view_model/group_cubit.dart';

part 'widget/create_group_listener.dart';
part 'widget/streamed_user_list.dart';

class GroupView extends StatelessWidget {
  final TextEditingController name = TextEditingController();
  GroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AppFloatingButton(
        onPressed: () {
          context.read<GroupCubit>().createGroup();
        },
        icon: Icons.done,
      ),
      appBar: AppBar(
        title: const Text('Create Group'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppTextForm(
              hintText: 'Group Name',
              controller: context.read<GroupCubit>().groupNameController,
            ),
          ),
          const StreamedUserList(),
          const CreateGroupListener(),
        ],
      ),
    );
  }
}
