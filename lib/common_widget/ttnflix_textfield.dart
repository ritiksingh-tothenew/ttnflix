import 'package:flutter/material.dart';
import 'package:ttnflix/themes/ttnflix_colors.dart';
import 'package:ttnflix/themes/ttnflix_sizes.dart';

class TtnFlixTextField extends StatelessWidget {
  const TtnFlixTextField(
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: TtnFlixSize.size16),
      child: TextField(
        keyboardType: textInputType,
        controller: textEditingController,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: textColor ?? TTnFlixColors.grey8),
        decoration: InputDecoration(
            hintText: hint ?? '',
            fillColor: Colors.white,
            filled: true,
            prefixIcon: prefixIcon),
      ),
    );
  }
}
