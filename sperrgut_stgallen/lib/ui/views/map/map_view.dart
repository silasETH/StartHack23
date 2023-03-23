import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
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
      appBar: AppBar(
        leadingWidth: 140,
        leading: MaterialButton(
          onPressed: viewModel.pop,
          child: Row(
            children: [
              const Icon(
                Icons.arrow_back_ios,
                color: Colors.red,
              ),
              Text(
                "Zurück",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: getResponsiveMediumFontSize(context)),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          MaterialButton(
            onPressed: viewModel.home,
            child: Center(
              child: Text(
                "Home",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: getResponsiveMediumFontSize(context)),
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: kcPrimaryColor,
            height: 2.0,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(mediumSize),
              child: Text(
                "Verkaufsstellen für Sperrgutmarken",
                style: TextStyle(
                  fontSize: getResponsiveMassiveFontSize(context),
                ),
              ),
            ),
            const Image(image: AssetImage('lib/assets/mocked_map.png'))
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
