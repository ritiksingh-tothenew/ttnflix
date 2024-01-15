import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ttnflix/authentication/model/gender.dart';
import 'package:ttnflix/common_widget/ttnflix_date_picker.dart';
import 'package:ttnflix/common_widget/ttnflix_dropdown.dart';
import 'package:ttnflix/common_widget/ttnflix_passwordfield.dart';
import 'package:ttnflix/common_widget/ttnflix_textfield.dart';
import 'package:ttnflix/navigation/ttnflix_autoroute.gr.dart';
import 'package:ttnflix/themes/ttnflix_colors.dart';

import '../../common_widget/ttnflix_button.dart';
import '../../generated/flutter_gen/assets.gen.dart';
import '../../themes/ttnflix_sizes.dart';

@RoutePage()
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final ImagePicker picker = ImagePicker();

  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final TextEditingController _confirmPasswordEditingController =
      TextEditingController();

// Pick an image.
  XFile? profileFile;

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(TtnFlixSize.size16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: TtnFlixSize.size24,
                  ),
                  Text(
                    appLocalizations.signup,
                    style: const TextStyle(
                        fontSize: TtnFlixSize.size30,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: TtnFlixSize.size16,
                  ),
                  Text(appLocalizations.create_account),
                  const SizedBox(
                    height: TtnFlixSize.size16,
                  ),
                  InkWell(
                    onTap: () {
                      showImagePickerBottomSheet(context, appLocalizations);
                    },
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            radius: TtnFlixSize.size50,
                            child: Image.asset(
                                fit: BoxFit.cover, Assets.icons.icUser.path),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: TtnFlixSize.size50),
                          child: Align(
                              alignment: Alignment.center,
                              child: Icon(Icons.add_box_rounded,
                                  color: Colors.white)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: TtnFlixSize.size24,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TtnFlixTextField(
                    textEditingController: _nameEditingController,
                    prefixIcon: const Icon(Icons.person),
                    hint: appLocalizations.name,
                    textInputType: TextInputType.name,
                  ),
                  TtnFlixTextField(
                    textEditingController: _emailEditingController,
                    prefixIcon: const Icon(Icons.email),
                    hint: appLocalizations.name,
                    textInputType: TextInputType.emailAddress,
                  ),
                  TtnFlixDatePickerField(
                    onSelectedDate: (date) {},
                    selectedDate: appLocalizations.dob,
                  ),
                  TtnFlixDropdown(
                    hintText: appLocalizations.male,
                    prefixIcon: const Icon(Icons.male),
                    dropDownData: getDropDownData(context, appLocalizations),
                    currentValue: '2',
                  ),
                  TtnPasswordField(
                    textEditingController: _passwordEditingController,
                    prefixIcon: const Icon(Icons.password),
                    hint: appLocalizations.password,
                    textInputType: TextInputType.visiblePassword,
                  ),
                  TtnPasswordField(
                    textEditingController: _confirmPasswordEditingController,
                    prefixIcon: const Icon(Icons.password),
                    hint: appLocalizations.confirm_password,
                  ),
                  const SizedBox(
                    height: TtnFlixSize.size8,
                  ),
                  TtnFlixButton(
                      onClick: () {}, buttonText: appLocalizations.signup)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(appLocalizations.already_have_account),
                  TextButton(
                      onPressed: () {
                        context.router.push(const SignInScreenRoute());
                      },
                      child: Text(
                        appLocalizations.login,
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
      ),
    );
  }

  void showImagePickerBottomSheet(
    BuildContext context,
    AppLocalizations appLocalizations,
  ) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        isScrollControlled: true,
        builder: (_) {
          return Container(
            height: TtnFlixSize.size100,
            decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(TtnFlixSize.size10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    profileFile =
                        await picker.pickImage(source: ImageSource.camera);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.camera_alt),
                      const SizedBox(
                        width: TtnFlixSize.size10,
                      ),
                      Text(
                        appLocalizations.camera,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: TTnFlixColors.grey8),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: TtnFlixSize.size24,
                ),
                InkWell(
                  onTap: () async {
                    profileFile =
                        await picker.pickImage(source: ImageSource.gallery);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.photo_camera_back_outlined),
                      const SizedBox(
                        width: TtnFlixSize.size10,
                      ),
                      Text(
                        appLocalizations.gallery,
                        style: Theme.of(context)
                            .textTheme
                            ?.titleMedium
                            ?.copyWith(color: TTnFlixColors.grey8),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  List<DropdownMenuItem<String>> getDropDownData(
      BuildContext context, AppLocalizations appLocalization) {
    var gender = [
      Gender(appLocalization.male, '1'),
      Gender(appLocalization.female, '2'),
      Gender(appLocalization.not_specified, '3')
    ];
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (var element in gender) {
      dropdownItems.add(DropdownMenuItem(
        value: element.id,
        child: Text(
          element.name,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: TTnFlixColors.grey8, fontWeight: FontWeight.w100),
        ),
      ));
    }
    return dropdownItems;
  }
}
