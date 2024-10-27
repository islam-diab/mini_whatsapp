import 'package:flutter/material.dart';
import 'package:mini_whatsapp/core/const/spaser.dart';
import 'package:mini_whatsapp/core/constants/app_assets.dart';
import 'package:mini_whatsapp/core/theming/app_colors.dart';
import 'package:mini_whatsapp/core/theming/app_text_styles.dart';

part 'widget/chat_view_item.dart';
part 'widget/chat_Floating_button.dart';
part 'widget/chat_view.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(children: [
      ChatsViewBody(),
      ChatFloatingButton(),
    ]);
  }
}
