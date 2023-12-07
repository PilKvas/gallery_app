part of '../../../presentation.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: AppColors.blue,
      ),
      leading: IconButton(
        onPressed: () {
          context.router.pop();
        },
        icon: const Icon(Icons.arrow_back_ios_new),
        color: AppColors.blue,
      ),
      elevation: 1,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
