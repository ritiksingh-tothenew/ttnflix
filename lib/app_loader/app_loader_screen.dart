import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ttnflix/navigation/ttnflix_autoroute.gr.dart';

@RoutePage()
class AppLoaderScreen extends StatelessWidget {
  const AppLoaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
  context.router.push(LoginScreenRoute());
    return Container();
  }
}
