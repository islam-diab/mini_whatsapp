part of '../home_view.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(55);
}

class _HomeAppBarState extends State<HomeAppBar> {
  bool isSearch = false;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: isSearch
          ? AppTextForm(
              hintText: 'Search...',
              controller: TextEditingController(),
              onChanged: (p0) {
                context.read<ChatsCubit>().searchRooms(p0);
              },
              onTapOutside: (event) {
                setState(() {
                  isSearch = !isSearch;
                });
                FocusManager.instance.primaryFocus?.unfocus();
              },
            )
          : const Text('WhatsApp'),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            setState(() {
              isSearch = !isSearch;
            });
          },
        ),
        PopupMenuButton(itemBuilder: (context) {
          return [
            PopupMenuItem(
              value: 1,
              child: const Text("Profile"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileView(),
                  ),
                );
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
}
