import 'package:flutter/material.dart';
import 'package:ttnflix/themes/ttnflix_colors.dart';
import 'package:ttnflix/themes/ttnflix_sizes.dart';

class TtnPasswordField extends StatefulWidget {
  const TtnPasswordField(
      {super.key,
      required this.textEditingController,
      this.hint,
      this.prefixIcon,
      this.textColor,
      this.error,
      this.textInputType});

  final TextEditingController textEditingController;
  final String? hint;
  final Icon? prefixIcon;
  final Color? textColor;
  final String? error;
  final TextInputType? textInputType;

  @override
  State<TtnPasswordField> createState() => _TtnPasswordFieldState(
      textEditingController, hint, prefixIcon, textColor, error, textInputType);
}

class _TtnPasswordFieldState extends State<TtnPasswordField> {
  bool _isPasswordVisible = true;
  final TextEditingController textEditingController;
  final String? hint;
  final Icon? prefixIcon;
  final Color? textColor;
  final String? error;
  final TextInputType? textInputType;

  _TtnPasswordFieldState(this.textEditingController, this.hint, this.prefixIcon,
      this.textColor, this.error, this.textInputType);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: TtnFlixSize.size16),
      child: TextField(
        obscureText: _isPasswordVisible,
        keyboardType: textInputType,
        controller: textEditingController,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: textColor ?? TTnFlixColors.grey8),
        decoration: InputDecoration(
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
                child: Icon(!_isPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off)),
            hintText: hint ?? '',
            fillColor: Colors.white,
            filled: true,
            prefixIcon: prefixIcon),
      ),
    );
  }
}
