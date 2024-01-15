import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ttnflix/common_widget/ttnflix_button.dart';
import 'package:ttnflix/common_widget/ttnflix_passwordfield.dart';
import 'package:ttnflix/common_widget/ttnflix_textfield.dart';
import 'package:ttnflix/generated/flutter_gen/assets.gen.dart';
import 'package:ttnflix/navigation/ttnflix_autoroute.gr.dart';
import 'package:ttnflix/themes/ttnflix_colors.dart';
import 'package:ttnflix/themes/ttnflix_sizes.dart';

@RoutePage()
class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(TtnFlixSize.size24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Image.asset(
                  Assets.icons.appLogoWhite.path,
                  width: TtnFlixSize.size100,
                  height: TtnFlixSize.size100,
                ),
                Text(
                  appLocalizations.welcome_back,
                  style: const TextStyle(
                      fontSize: TtnFlixSize.size40,
                      fontWeight: FontWeight.bold),
                ),
                Text(appLocalizations.enter_credentials),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TtnFlixTextField(
                  textEditingController: _emailEditingController,
                  prefixIcon: const Icon(Icons.email),
                  hint: appLocalizations.name,
                  textInputType: TextInputType.emailAddress,
                ),
                TtnPasswordField(
                  textEditingController: _passwordEditingController,
                  prefixIcon: const Icon(Icons.password),
                  hint: appLocalizations.password,
                  textInputType: TextInputType.visiblePassword,
                ),
                TtnFlixButton(
                    onClick: () {}, buttonText: appLocalizations.login)
              ],
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                appLocalizations.forgot_password,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: TTnFlixColors.blueLightColor),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(appLocalizations.dont_have_account),
                TextButton(
                    onPressed: () {
                      context.router.push(const SignUpScreenRoute());
                    },
                    child: Text(
                      appLocalizations.signup,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: TTnFlixColors.blueLightColor),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
