part of '../presentation.dart';


class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      strokeWidth: 0.5,
      color: Colors.grey,
    );
  }
}
