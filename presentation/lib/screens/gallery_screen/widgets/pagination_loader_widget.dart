part of '../../../presentation.dart';

class PaginationLoaderWidget extends StatelessWidget {
  const PaginationLoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10),
      child: Center(
        child: CustomProgressIndicator(),
      ),
    );
  }
}
