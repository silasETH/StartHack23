import 'package:flutter/material.dart';
import 'package:sperrgut_stgallen/ui/common/custom_appbar.dart';
import 'package:stacked/stacked.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../common/ui_helpers.dart';
import 'map_viewmodel.dart';

class MapView extends StackedView<MapViewModel> {
  const MapView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MapViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: CustomAppBar(
        back: viewModel.pop,
        home: viewModel.home,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(mediumSize),
              child: Text(
                "Verkaufsstellen für Sperrgutmarken",
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: WebViewWidget(
                  controller: viewModel.controller,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  MapViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MapViewModel();
}
