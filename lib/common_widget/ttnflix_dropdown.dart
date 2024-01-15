import 'package:flutter/material.dart';
import 'package:ttnflix/themes/ttnflix_sizes.dart';

import '../themes/ttnflix_colors.dart';

class TtnFlixDropdown extends StatelessWidget {
  const TtnFlixDropdown(
      {super.key,
      this.hintText,
      this.textColor,
      this.prefixIcon,
      this.dropDownData,
      this.currentValue});

  final String? hintText;
  final Color? textColor;
  final Icon? prefixIcon;
  final String? currentValue;

  final List<DropdownMenuItem<String>>? dropDownData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: TtnFlixSize.size16),
      child: DropdownButtonFormField<String>(
        value: currentValue ?? '2',
        decoration: const InputDecoration(
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Icon(Icons.male),
        ),
        hint: Text(
          hintText ?? '',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: textColor ?? TTnFlixColors.grey8),
        ),
        icon: const Icon(
          Icons.keyboard_arrow_down,
          // color: Colors.white,
        ),
        iconSize: TtnFlixSize.size24,
        dropdownColor: Colors.white,
        items: dropDownData,
        onChanged: (value) {},
      ),
    );
  }
}
