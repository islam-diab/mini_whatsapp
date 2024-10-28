import 'package:flutter/material.dart';
import 'package:mini_whatsapp/core/constants/app_assets.dart';
import 'package:mini_whatsapp/core/theming/app_colors.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Stack(
        children: [
          const CircleAvatar(
            radius: 90,
            backgroundImage: AssetImage(AppAssets.test),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: () {},
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Center(
                    child: Icon(
                      size: 20,
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
