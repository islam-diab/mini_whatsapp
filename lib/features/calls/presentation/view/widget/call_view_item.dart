import 'package:flutter/material.dart';
import 'package:mini_whatsapp/core/constants/app_assets.dart';
import 'package:mini_whatsapp/core/theming/app_text_styles.dart';

class CallViewItem extends StatelessWidget {
  const CallViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(
          AppAssets.test,
        ),
      ),
      title: const Text(
        'Islam Diab',
        style: AppTextStyles.font18Semibold,
      ),
      subtitle: const Row(
        children: [
          Icon(Icons.arrow_outward_sharp, color: Colors.blueGrey, size: 20),
          SizedBox(width: 5),
          Text(
            'Today, 2:00 PM',
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.call),
      ),
    );
  }
}
