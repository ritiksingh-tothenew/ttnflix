import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:ttnflix/common_widget/ttnflix_button.dart';
import 'package:ttnflix/generated/flutter_gen/assets.gen.dart';
import 'package:ttnflix/themes/ttnflix_colors.dart';
import 'package:ttnflix/themes/ttnflix_sizes.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(TtnFlixSize.size24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _header(context),
            _inputField(context),
            _forgotPassword(context),
            _signup(context),
          ],
        ),
      ),
    );
  }

  _header(context) {
    return Column(
      children: [
        Image.asset(
          Assets.icons.appLogoWhite.path,
          width: TtnFlixSize.size100,
          height: TtnFlixSize.size100,
        ),
        const Text(
          "Welcome Back",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        const Text("Enter your credential to login"),
      ],
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const TextField(
          decoration: InputDecoration(
              hintText: "Username",
              fillColor: Colors.white,
              filled: true,
              prefixIcon: Icon(Icons.person)),
        ),
        const SizedBox(height: 10),
        const TextField(
          decoration: InputDecoration(
            hintText: "Password",
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(Icons.password),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 10),
        TtnFlixButton(onClick: () {}, buttonText: 'Login')
      ],
    );
  }

  _forgotPassword(context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        "Forgot password?",
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: TTnFlixColors.blueLightColor),
      ),
    );
  }

  _signup(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account? "),
        TextButton(
            onPressed: () {},
            child: Text(
              "Sign Up",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: TTnFlixColors.blueLightColor),
            ))
      ],
    );
  }
}
