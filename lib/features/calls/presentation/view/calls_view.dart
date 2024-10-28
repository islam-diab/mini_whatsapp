import 'package:flutter/widgets.dart';
import 'package:mini_whatsapp/features/calls/presentation/view/widget/call_view_item.dart';

class CallsView extends StatelessWidget {
  const CallsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const CallViewItem(),
    );
  }
}
