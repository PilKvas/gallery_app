part of '../presentation.dart';


class CustomProgressIndicator extends StatelessWidget {
  final Color color;
  const CustomProgressIndicator({super.key, this.color = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return  CircularProgressIndicator(
      strokeWidth: 0.5,
      color: color,
    );
  }
}
