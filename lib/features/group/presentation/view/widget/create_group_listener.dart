part of '../group_view.dart';

class CreateGroupListener extends StatelessWidget {
  const CreateGroupListener({super.key});

  /// Handle pressed when group is created
  void _handlePressed(BuildContext context, types.Room room) async {
    final navigator = Navigator.of(context);

    navigator.pop();
    await navigator.push(
      MaterialPageRoute(
        builder: (context) => ChatView(
          room: room,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GroupCubit, GroupState>(
      listenWhen: (previous, current) =>
          current is GroupLoaded ||
          current is GroupError ||
          current is GroupLoading,
      listener: (context, state) {
        if (state is GroupLoading) {
          showAdaptiveDialog(
              context: context,
              builder: (context) =>
                  const Center(child: CircularProgressIndicator()));
        } else if (state is GroupError) {
          showAdaptiveDialog(
            context: context,
            builder: (context) => AppAlertDialog(content: state.message),
          );
        } else if (state is GroupLoaded) {
          _handlePressed(context, state.room);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
