import 'package:flutter/material.dart';
import 'package:sperrgut_stgallen/ui/common/custom_appbar.dart';
import 'package:stacked/stacked.dart';

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
            const Expanded(
                child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Image(image: AssetImage('lib/assets/mocked_map.png')),
            ))
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
