import 'package:flutter/material.dart';
import 'package:ttnflix/themes/ttnflix_colors.dart';
import 'package:ttnflix/themes/ttnflix_sizes.dart';

class TtnFlixDatePickerField extends StatelessWidget {
  const TtnFlixDatePickerField(
      {super.key, this.selectedDate, required this.onSelectedDate});

  final String? selectedDate;
  final Function(String date) onSelectedDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: TtnFlixSize.size16),
      child: GestureDetector(
        onTap: () {
          _selectDate(context, onSelectedDate, selectedDate);
        },
        child: Container(
          padding: const EdgeInsets.all(TtnFlixSize.size16),
          height: TtnFlixSize.size50,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(TtnFlixSize.size16)),
          child: Row(
            children: [
              Icon(Icons.calendar_month,
                  color: TTnFlixColors
                      .tabSecondaryTextColor[Theme.of(context).brightness]),
              const SizedBox(
                width: TtnFlixSize.size8,
              ),
              Text(
                selectedDate ?? '',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: TTnFlixColors
                        .tabSecondaryTextColor[Theme.of(context).brightness]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context,
      Function(String date) onSelectedDate, String? selectedDate) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1970, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      onSelectedDate(picked.toString());
    }
  }
}
