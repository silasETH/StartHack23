import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sperrgut_stgallen/ui/common/app_colors.dart';
import 'package:sperrgut_stgallen/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.loadUserData();
  }

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
          title: const AutoSizeText(
            'Sperrgut Stadt St. Gallen',
            style: TextStyle(
              fontSize: 18.0,
              color: kcDarkGreyColor,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
          ),
          leading: const Padding(
            padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
            child: Image(image: AssetImage('lib/assets/logo_sg.png')),
          ),
          backgroundColor: Colors.white,
          actions: [
            MaterialButton(
              onPressed: viewModel.info,
              child: const Icon(
                Icons.info_outline,
                color: kcDarkGreyColor,
                size: 30,
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: kcPrimaryColor,
              height: 2.0,
            ),
          )),
      body: SafeArea(
        child: Column(children: [
          verticalSpaceMedium,
          const Expanded(
            child: Image(image: AssetImage('lib/assets/hero-image.png')),
          ),
          verticalSpaceMedium,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(children: [
                    Expanded(
                      child: HomeScreenButton(
                        label: 'Sperrgut\nanmelden',
                        icon: Icons.add,
                        onPressedFunction: viewModel.registerItem,
                      ),
                    ),
                    horizontalSpaceMedium,
                    Expanded(
                      child: HomeScreenButton(
                        label: 'Übersicht\ne-Stamps',
                        icon: Icons.receipt_long_sharp,
                        onPressedFunction: viewModel.receipts,
                      ),
                    ),
                  ]),
                  verticalSpaceMedium,
                  Row(
                    children: [
                      Expanded(
                        child: HomeScreenButton(
                          label: 'Informationen\nSperrgut',
                          icon: Icons.info_outline,
                          onPressedFunction: viewModel.info,
                        ),
                      ),
                      horizontalSpaceMedium,
                      Expanded(
                        child: HomeScreenButton(
                          label: 'Verkaufsstellen\nfinden',
                          icon: Icons.map_outlined,
                          onPressedFunction: viewModel.map,
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceLarge
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}

class HomeScreenButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function()? onPressedFunction;

  const HomeScreenButton({
    super.key,
    required this.label,
    required this.icon,
    this.onPressedFunction,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      onPressed: onPressedFunction,
      child: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpaceSmall,
            Icon(
              icon,
              color: kcDarkGreyColor,
              size: 50,
            ),
            verticalSpaceSmall,
            AutoSizeText(
              label,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
              maxLines: 2,
              wrapWords: false,
            ),
          ],
        ),
      ),
    );
  }
}
