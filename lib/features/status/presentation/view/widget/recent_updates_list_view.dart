import 'package:flutter/material.dart';
import 'package:mini_whatsapp/core/constants/app_assets.dart';
import 'package:mini_whatsapp/core/theming/app_colors.dart';
import 'package:mini_whatsapp/core/theming/app_text_styles.dart';

class RecentUpdatesListView extends StatelessWidget {
  final bool isShow;
  const RecentUpdatesListView({
    super.key,
    this.isShow = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isShow ? Colors.grey : AppColors.secondaryColor,
                width: 2,
              ),
            ),
            child: const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(AppAssets.test),
            ),
          ),
          title: const Text(
            'Islam Diab',
            style: AppTextStyles.font18Semibold,
          ),
          subtitle: const Text(
            'Today, 10:00 PM',
          ),
        );
      },
    );
  }
}
