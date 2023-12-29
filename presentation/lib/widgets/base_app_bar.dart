part of '../presentation.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;

  const BaseAppBar({super.key, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      iconTheme: const IconThemeData(
        color: AppColors.blue,
      ),
      elevation: 1,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
