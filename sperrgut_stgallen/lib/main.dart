import 'package:flutter/material.dart';
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Theme.of(context).copyWith(
        primaryColor: kcPrimaryColor,
        focusColor: kcPrimaryColor,
        scaffoldBackgroundColor: kcBackgroundColor,
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 36.0,
            color: kcDarkGreyColor,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: TextStyle(
          fontSize: 20.0,
          color: kcDarkGreyColor,
          fontWeight: FontWeight.bold,
        ),
          titleMedium: TextStyle(
            fontSize: 18.0,
            color: kcDarkGreyColor,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            fontSize: 18.0,
            color: kcDarkGreyColor,
          ),
          bodyMedium: TextStyle(
            fontSize: 16.0,
            color: kcDarkGreyColor,
          ),
        )
      ),
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
