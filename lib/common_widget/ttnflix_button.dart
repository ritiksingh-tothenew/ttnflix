import 'package:flutter/material.dart';
import 'package:ttnflix/themes/ttnflix_colors.dart';
import 'package:ttnflix/themes/ttnflix_sizes.dart';

class TtnFlixButton extends StatelessWidget {
  const TtnFlixButton(
      {super.key, required this.onClick, required this.buttonText});

  final Function() onClick;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TtnFlixSize.size10),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
          ],
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 1.0],
            colors: [
              TTnFlixColors.blueLightColor,
              TTnFlixColors.blueDarkColor,
            ],
          ),
          color: Colors.deepPurple.shade300,
          borderRadius: BorderRadius.circular(TtnFlixSize.size20),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(TtnFlixSize.size20),
              ),
            ),
            minimumSize: MaterialStateProperty.all(
                const Size(TtnFlixSize.size50, TtnFlixSize.size24)),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            // elevation: MaterialStateProperty.all(3),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: onClick,
          child: Padding(
            padding: const EdgeInsets.only(
              top: TtnFlixSize.size10,
              bottom: TtnFlixSize.size10,
            ),
            child: Text(buttonText,
                style: Theme.of(context).textTheme.titleMedium),
          ),
        ),
      ),
    );
  }
}
