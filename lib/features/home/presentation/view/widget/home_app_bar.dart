part of '../home_view.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("WhatsUp"),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
        PopupMenuButton(itemBuilder: (context) {
          return [
            PopupMenuItem(
              value: 1,
              child: const Text("Profile"),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const ProfileView(),
                //   ),
                // );
              },
            ),
            const PopupMenuItem(
              value: 2,
              child: Text("Setting"),
            ),
          ];
        })
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
