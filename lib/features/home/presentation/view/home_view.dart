import 'package:flutter/material.dart';
import 'package:mini_whatsapp/core/theming/app_colors.dart';
import 'package:mini_whatsapp/features/calls/presentation/view/calls_view.dart';
import 'package:mini_whatsapp/features/chats/presentation/view/chats_view.dart';
import 'package:mini_whatsapp/features/profile/presentation/view/profile_view.dart';
import 'package:mini_whatsapp/features/status/presentation/view/status_view.dart';

part 'widget/custom_bottom_navigation_bar.dart';
part 'widget/home_app_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentSelectedIndex = 0;

  void updateCurrentIndex(int index) {
    setState(() {
      currentSelectedIndex = index;
    });
  }

  final pages = [
    const ChatsView(),
    const StatusView(),
    const CallsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: pages[currentSelectedIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentSelectedIndex: currentSelectedIndex,
        onTap: updateCurrentIndex,
      ),
    );
  }
}
