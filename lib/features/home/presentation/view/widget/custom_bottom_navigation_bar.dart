part of '../home_view.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentSelectedIndex;
  final Function(int)? onTap;
  const CustomBottomNavigationBar(
      {super.key, required this.currentSelectedIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: currentSelectedIndex,
      showSelectedLabels: true,
      selectedItemColor: AppColors.primaryColor,
      useLegacyColorScheme: true,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.chat_outlined,
          ),
          activeIcon: Icon(
            Icons.chat,
          ),
          label: "Chats",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.tips_and_updates_outlined),
          activeIcon: Icon(
            Icons.tips_and_updates,
          ),
          label: "Status",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.call_outlined),
          activeIcon: Icon(
            Icons.call,
          ),
          label: "Calls",
        ),
      ],
    );
  }
}
