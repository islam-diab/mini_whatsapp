part of '../chats_view.dart';

class ChatsBody extends StatelessWidget {
  const ChatsBody({super.key});

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
        'Islam Salama',
        style: AppTextStyles.font18Semibold,
      ),
      subtitle: const Row(
        children: [
          Icon(Icons.done_all, color: Colors.blueGrey, size: 20),
          SizedBox(width: 5),
          Text(
            'NEW MESSAGE',
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text('9:15 AM'),
          verticalSpace(5),
          const CircleAvatar(
            radius: 12,
            backgroundColor: AppColors.primaryColor,
            child: Center(
              child: Text(
                '1',
                style: AppTextStyles.font12White,
              ),
            ),
          )
        ],
      ),
    );
  }
}
