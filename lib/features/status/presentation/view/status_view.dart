import 'package:flutter/widgets.dart';
import 'package:mini_whatsapp/features/status/presentation/view/widget/add_status_widget.dart';
import 'package:mini_whatsapp/features/status/presentation/view/widget/recent_updates_list_view.dart';
import 'package:mini_whatsapp/features/status/presentation/view/widget/title_text.dart';

class StatusView extends StatelessWidget {
  const StatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        AddStatusWidget(),
        TitleText(
          title: 'Recent updates',
        ),
        RecentUpdatesListView(),
        TitleText(title: 'Viewed updates'),
        RecentUpdatesListView(
          isShow: true,
        )
      ],
    );
  }
}
