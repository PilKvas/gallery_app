part of '../presentation.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;

  const BaseScaffold({required this.body, super.key, this.appBar});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        appBar: appBar,
        body: body,
      ),
      onTap: FocusScope.of(context).unfocus,
    );
  }
}
