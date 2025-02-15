part of '../presentation.dart';

class BaseTextField extends StatefulWidget {
  final bool showClearIcon;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? icon;
  final bool filled;
  final bool showError;
  final bool? readOnly;
  final bool isRequired;
  final bool isPassword;
  final String? hintText;
  final Color? fillColor;
  final String? errorText;
  final Widget? prefixIcon;
  final InputBorder? border;
  final bool isIconPressible;
  final VoidCallback? onPressed;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final ValueChanged<DateTime>? onDateChange;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlignVertical? textAlignVertical;
  final String? initialValue;
  final bool? isDebounsed;
  final bool? isEditTextField;

  const BaseTextField({
    required this.showClearIcon,
    required this.filled,
    this.icon,
    super.key,
    this.border,
    this.hintText,
    this.validator,
    this.fillColor,
    this.errorText,
    this.onPressed,
    this.onChanged,
    this.controller,
    this.prefixIcon,
    this.keyboardType,
    this.onDateChange,
    this.inputFormatters,
    this.readOnly = false,
    this.showError = false,
    this.isRequired = false,
    this.isPassword = false,
    this.isIconPressible = false,
    this.contentPadding,
    this.textAlignVertical,
    this.initialValue,
    this.isDebounsed,
    this.isEditTextField = false,
  });

  @override
  State<BaseTextField> createState() => _BaseTextFieldState();
}

class _BaseTextFieldState extends State<BaseTextField> {
  late final TextEditingController _textController;
  final _debouncer = Debouncer(milliseconds: 500);
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  late bool _isObscured;
  late DateTime? _selectedDate;

  @override
  void didUpdateWidget(covariant BaseTextField oldWidget) {
    if (widget.isEditTextField == false) return;
    _textController.text = widget.initialValue ?? '';
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
    _isObscured = widget.isPassword;
    _textController = widget.controller ??
        TextEditingController(
          text: widget.initialValue,
        );
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

  void clearInput() {
    _textController.clear();
    widget.onChanged?.call(_textController.text);
    widget.onPressed?.call();
  }

  void showPassword() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  Widget? defineIcon() {
    if (widget.isIconPressible) {
      if (widget.showClearIcon) {
        return SvgPicture.asset(
          AppAssets.searchEraseIcon,
          color: _isFocused ? AppColors.main : Colors.grey,
        );
      } else if (_isObscured) {
        return SvgPicture.asset(AppAssets.eyeOffIcon);
      } else {
        return SvgPicture.asset(AppAssets.eyeIcon);
      }
    }

    return widget.icon;
  }

  void defineIconButton() {
    if (widget.isIconPressible) {
      if (widget.showClearIcon) {
        clearInput();
      } else {
        showPassword();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextFormField(
        onTap: () async {
          if (widget.onDateChange != null) {
            final date = await _showDatePicker();

            if (date != null) {
              widget.onDateChange?.call(date);
            }
          }
        },
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,
        obscureText: _isObscured,
        readOnly: widget.readOnly ?? false,
        validator: widget.validator,
        controller: _textController,
        focusNode: _focusNode,
        textAlignVertical: widget.textAlignVertical,
        onChanged: (text) {
          if (widget.isDebounsed == false) {
            widget.onChanged?.call(text);
          } else {
            _debouncer.run(
              () {
                widget.onChanged?.call(text);
              },
            );
          }
        },
        decoration: InputDecoration(
          isDense: false,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 2, color: AppColors.main),
          ),
          errorText: widget.errorText,
          filled: widget.filled,
          fillColor: widget.fillColor,
          contentPadding: widget.contentPadding ?? const EdgeInsets.all(8),
          prefixIcon: widget.prefixIcon,
          suffixIcon: IconButton(
            splashRadius: 10,
            icon: defineIcon() ?? const SizedBox(),
            onPressed: defineIconButton,
          ),
          hintText: widget.hintText,
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.grey,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Future<DateTime?> _showDatePicker() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (date != null) {
      _selectedDate = date;
      widget.controller?.text = _selectedDate!.formatDate!;

      return date;
    }

    return null;
  }
}
