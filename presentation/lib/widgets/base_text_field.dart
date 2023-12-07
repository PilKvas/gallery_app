part of '../presentation.dart';

class BaseTextField extends StatefulWidget {
  final VoidCallback? onPressed;
  final ValueChanged<String>? onChanged;
  final bool isErase;
  final Widget? prefixIcon;
  final String? hintText;
  final Color? fillColor;
  final TextEditingController? controller;
  final InputBorder? border;
  final String? Function(String?)? validator;
  final bool? readOnly;
  final String? errorText;
  final bool showError;
  final bool isRequired;
  final Widget icon;
  final bool filled;
  final bool isPassword;
  final bool isIconPressible;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final ValueChanged<DateTime>? onDateChange;

  const BaseTextField({
    required this.icon,
    required this.isErase,
    required this.filled,
    this.isPassword = false,
    this.fillColor,
    this.readOnly = false,
    this.errorText,
    this.showError = false,
    this.isRequired = false,
    this.onPressed,
    this.onChanged,
    super.key,
    this.controller,
    this.prefixIcon,
    this.hintText,
    this.border,
    this.validator,
    this.isIconPressible = false,
    this.inputFormatters,
    this.keyboardType,
    this.onDateChange,
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
  void initState() {
    super.initState();
    _isObscured = widget.isPassword;
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
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 10,
        right: 10,
      ),
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
        onChanged: (text) {
          _debouncer.run(
            () {
              widget.onChanged?.call(text);
            },
          );
        },
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 2, color: AppColors.main),
          ),
          errorText: widget.errorText,
          filled: widget.filled,
          fillColor: widget.fillColor,
          contentPadding: const EdgeInsets.all(8),
          prefixIcon: widget.prefixIcon,
          suffixIcon: IconButton(
            splashRadius: 10,
            icon: widget.isIconPressible
                ? widget.isErase
                    ? SvgPicture.asset(
                        AppAssets.searchEraseIcon,
                        color: switch (_isFocused) {
                          true => AppColors.main,
                          _ => Colors.grey,
                        },
                      )
                    : _isObscured
                        ? SvgPicture.asset(AppAssets.eyeOffIcon)
                        : SvgPicture.asset(AppAssets.eyeIcon)
                : widget.icon,
            onPressed: widget.isIconPressible
                ? widget.isErase
                    ? () {
                        _textController.clear();
                        widget.onChanged?.call(_textController.text);
                        widget.onPressed?.call();
                      }
                    : () {
                        setState(() {
                          _isObscured = !_isObscured;
                        });
                      }
                : null,
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
      lastDate: DateTime(2100),
    );

    if (date != null) {
      _selectedDate = date;
      widget.controller?.text = _selectedDate!.formatDate;

      return date;
    }

    return null;
  }
}
