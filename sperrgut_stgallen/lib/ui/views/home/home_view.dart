import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:sperrgut_stgallen/ui/common/app_colors.dart';
import 'package:sperrgut_stgallen/ui/common/ui_helpers.dart';

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
          ),),
          leading: const Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
            child: Image(image: AssetImage('lib/assets/logo_sg.png')),
          ),
        backgroundColor: Colors.white,
        actions: const [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
            child: Icon(Icons.info_outline, color: kcDarkGreyColor, size: 30,),
          ),
        ],
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: kcPrimaryColor,
              height: 2.0,
            ),
        )
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                children: [
                Expanded(
                  child: MaterialButton(
                    padding: const EdgeInsets.all(20),
                    color: Colors.white,
                    onPressed: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.add, color: kcDarkGreyColor, size: 50,),
                        verticalSpaceSmall,
                        Text(
                          'Sperrgut anmelden',
                          style: TextStyle(color: kcDarkGreyColor, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                horizontalSpaceMedium,
                Expanded(
                  child: MaterialButton(
                    padding: const EdgeInsets.all(20),
                    color: Colors.white,
                    onPressed: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.add, color: kcDarkGreyColor, size: 50,),
                        verticalSpaceSmall,
                        Text(
                          'Sperrgut anmelden',
                          style: TextStyle(color: kcDarkGreyColor, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                ]),
                verticalSpaceMedium,
                Row(
                children: [
                Expanded(
                  child: MaterialButton(
                    padding: const EdgeInsets.all(20),
                    color: Colors.white,
                    onPressed: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.add, color: kcDarkGreyColor, size: 50,),
                        verticalSpaceSmall,
                        Text(
                          'Sperrgut anmelden',
                          style: TextStyle(color: kcDarkGreyColor, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                horizontalSpaceMedium,
                Expanded(
                  child: MaterialButton(
                    padding: const EdgeInsets.all(20),
                    color: Colors.white,
                    onPressed: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.add, color: kcDarkGreyColor, size: 50,),
                        verticalSpaceSmall,
                        Text(
                          'Sperrgut anmelden',
                          style: TextStyle(color: kcDarkGreyColor, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                ],),
                verticalSpaceLarge
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
