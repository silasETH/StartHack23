import 'dart:ui';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';

class MapViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..loadRequest(
      Uri.dataFromString(
          '<html><body><iframe src="https://daten.stadt.sg.ch/explore/embed/dataset/sperrgutmarken-verkauf/map/?location=14,47.42127,9.35722&basemap=jawg.streets&static=false&datasetcard=false&scrollWheelZoom=true" width="1000" height="2200" frameborder="0"></iframe></body></html>',
          mimeType: 'text/html'),
    );

  void pop() {
    _navigationService.back();
  }

  void home() {
    _navigationService
        .popUntil((route) => route.settings.name == Routes.homeView);
  }
}
