import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ttnflix/di/app_module.dart';
import 'package:ttnflix/navigation/ttnflix_autoroute.dart';
import 'package:ttnflix/themes/ttnflix_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppModule().initialise();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = TtnFlixAppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: TtnFlixTheme.lightTheme,
      darkTheme: TtnFlixTheme.darkTheme,
      routerConfig: _appRouter.config(),
    );
  }
}
