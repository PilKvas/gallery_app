part of '../../../presentation.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenSize.height * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.search,
            size: 100,
            color: Colors.grey,
          ),
          Text(
            context.localization.onSearch,
            style: context.styling.textTheme.searchError,
          ),
        ],
      ),
    );
  }
}
