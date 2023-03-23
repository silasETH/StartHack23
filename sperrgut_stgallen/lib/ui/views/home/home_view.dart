import 'package:flutter/material.dart';
import 'package:sperrgut_stgallen/ui/common/app_colors.dart';
import 'package:sperrgut_stgallen/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Sperrgut Stadt St. Gallen',
            style: TextStyle(
              color: kcDarkGreyColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: const Padding(
            padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
            child: Image(image: AssetImage('lib/assets/logo_sg.png')),
          ),
          backgroundColor: Colors.white,
          actions: const [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
              child: Icon(
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
        child: Stack(children: [
          Container(
            margin: EdgeInsets.fromLTRB(10, 100, 10, 0),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/hero-image.png'),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(children: [
                    Expanded(
                      child: HomeScreenButton(
                        label: 'Sperrgut anmelden',
                        icon: Icons.add,
                        onPressedFunction: () {},
                      ),
                    ),
                    horizontalSpaceMedium,
                    Expanded(
                      child: HomeScreenButton(
                        label: 'Quittungen',
                        icon: Icons.receipt_long_sharp,
                        onPressedFunction: () {},
                      ),
                    ),
                  ]),
                  verticalSpaceMedium,
                  Row(
                    children: [
                      Expanded(
                        child: HomeScreenButton(
                          label: 'Informationen',
                          icon: Icons.info_outline,
                          onPressedFunction: () {},
                        ),
                      ),
                      horizontalSpaceMedium,
                      Expanded(
                        child: HomeScreenButton(
                          label: 'Verkaufsstellen finden',
                          icon: Icons.map_outlined,
                          onPressedFunction: () {},
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
      onPressed: () {},
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
            Text(
              label,
              style: const TextStyle(color: kcDarkGreyColor, fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
