import 'package:flutter/material.dart';
import 'package:sperrgut_stgallen/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';

import '../../common/ui_helpers.dart';
import 'info_viewmodel.dart';

class InfoView extends StackedView<InfoViewModel> {
  const InfoView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    InfoViewModel viewModel,
    Widget? child,
  ) {
    final List<String> questions = <String>[
      'Was gehört ins Sperrgut?',
      'Wann wird Sperrgut abgeholt?',
      'Wo sind die Entsorgungszentren?',
    ];

    final List<RichText> answers = <RichText>[
      RichText(
        text: const TextSpan(
          text:
              "In das Sperrgut gehören brennbare grosse Güter, wie z.B. Möbel, Teppiche, Ski, Matratzen, Betten, Tische, Stühle oder Koffer.",
          style: TextStyle(color: Colors.black),
        ),
      ),
      RichText(
        text: TextSpan(
          text: "Das Sperrgut wird jeweils mit der wöchentlichen ",
          style: DefaultTextStyle.of(context).style,
        ),
      ),
      RichText(
        text: TextSpan(
          text: "Alles.",
          style: DefaultTextStyle.of(context).style,
        ),
      ),
    ];

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
            Expanded(
              child: ListView.separated(
                itemCount: questions.length,
                itemBuilder: (BuildContext context, int index) {
                  return ExpansionTile(
                    title: Text(questions[index]),
                    textColor: kcPrimaryColor,
                    iconColor: kcPrimaryColor,
                    children: [
                      Container(
                          //padding: paddingMedium,
                          child: Expanded(child: answers[index])),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  InfoViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      InfoViewModel();
}
