import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sperrgut_stgallen/app/app.bottomsheets.dart';
import 'package:sperrgut_stgallen/app/app.dialogs.dart';
import 'package:sperrgut_stgallen/app/app.locator.dart';
import 'package:sperrgut_stgallen/app/app.router.dart';
import 'package:sperrgut_stgallen/ui/common/app_colors.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();
  setupDialogUi();
  setupBottomSheetUi();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Sperrgut Stadt St. Gallen',
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(
          primaryColor: kcPrimaryColor,
          focusColor: kcPrimaryColor,
          highlightColor: kcPrimaryColor.withAlpha(10),
          splashColor: kcPrimaryColor.withAlpha(20),
          scaffoldBackgroundColor: kcBackgroundColor,
          colorScheme: ColorScheme.fromSwatch(
            accentColor: kcPrimaryColor,
          ),
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontSize: 34.0,
              color: kcDarkGreyColor,
              fontWeight: FontWeight.w300,
              fontFamily: 'Source Sans Pro',
            ),
            titleLarge: TextStyle(
              fontSize: 20.0,
              color: kcDarkGreyColor,
              fontWeight: FontWeight.bold,
              fontFamily: 'Source Sans Pro',
            ),
            titleMedium: TextStyle(
              fontSize: 17.0,
              color: kcDarkGreyColor,
              fontWeight: FontWeight.bold,
              fontFamily: 'Source Sans Pro',
            ),
            bodyLarge: TextStyle(
              fontSize: 17.0,
              color: kcDarkGreyColor,
              fontWeight: FontWeight.bold,
              fontFamily: 'Source Sans Pro',
            ),
            bodyMedium: TextStyle(
              fontSize: 16.0,
              color: kcDarkGreyColor,
              fontFamily: 'Source Sans Pro',
            ),
          )),
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
