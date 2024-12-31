import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_whatsapp/features/chats/presentation/view/widget/util.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:mini_whatsapp/features/group/presentation/view_model/group_cubit.dart';

class SelectUser extends StatefulWidget {
  final List<types.User> allUsers;
  const SelectUser({super.key, required this.allUsers});

  @override
  State<SelectUser> createState() => _SelectUserState();
}

class _SelectUserState extends State<SelectUser> {
  final List<types.User> selectedUsers = [];

  void _toggleUserSelection(types.User user) {
    setState(() {
      if (selectedUsers.contains(user)) {
        selectedUsers.remove(user);
      } else {
        selectedUsers.add(user);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.allUsers.length,
      itemBuilder: (context, index) {
        final user = widget.allUsers[index];
        final isSelected = selectedUsers.contains(user);

        context.read<GroupCubit>().usersInGroup = selectedUsers;

        return Padding(
          padding: const EdgeInsets.only(left: 18, bottom: 10),
          child: Row(
            children: [
              IconButton(
                onPressed: () => _toggleUserSelection(user),
                icon: Icon(
                  isSelected
                      ? Icons.check_box_outlined
                      : Icons.check_box_outline_blank,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 16),
                child: CircleAvatar(
                  backgroundColor: user.imageUrl == null
                      ? getUserAvatarNameColor(user)
                      : Colors.transparent,
                  backgroundImage: user.imageUrl != null
                      ? NetworkImage(user.imageUrl!)
                      : null,
                  radius: 20,
                ),
              ),
              Text(user.firstName ?? 'Anonymous'),
            ],
          ),
        );
      },
    );
  }
}
