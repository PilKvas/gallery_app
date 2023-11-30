part of '../presentation.dart';

class BaseTextField extends StatefulWidget {
  final VoidCallback? onPressed;
  final ValueChanged<String>? onChanged;

  final TextEditingController? controller;

  const BaseTextField({this.onPressed, this.onChanged, super.key, this.controller});

  @override
  State<BaseTextField> createState() => _BaseTextFieldState();
}

class _BaseTextFieldState extends State<BaseTextField> {
  late final TextEditingController _textController;
  final _debouncer = Debouncer(milliseconds: 500);
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _textController = widget.controller ?? TextEditingController();
    _focusNode.addListener(
      () {
        if (context.mounted) {
          setState(
            () {
              _isFocused = _focusNode.hasFocus;
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      focusNode: _focusNode,
      onChanged: (text) {
        _debouncer.run(
          () {
            widget.onChanged?.call(text);
          },
        );
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.textFieldColor,
        contentPadding: const EdgeInsets.all(8),
        prefixIcon: const Icon(
          Icons.search,
          color: AppColors.prefixIconColor,
          size: 25,
        ),
        suffixIcon: IconButton(
          splashRadius: 5,
          icon: Icon(
            Icons.cancel,
            color: switch (_isFocused) {
              true => AppColors.hightLightColor,
              _ => Colors.grey,
            },
          ),
          onPressed: () {
            _textController.clear();
            widget.onChanged?.call(_textController.text);
            widget.onPressed?.call();
          },
        ),
        hintText: context.localization.searchField,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
