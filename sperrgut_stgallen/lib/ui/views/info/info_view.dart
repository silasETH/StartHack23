import 'package:flutter/material.dart';
import 'package:sperrgut_stgallen/ui/common/app_colors.dart';
import 'package:sperrgut_stgallen/ui/common/custom_appbar.dart';
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
        text: const TextSpan(
          text:
              "Das Sperrgut wird jeweils mit der wöchentlichen Kehrichtabfuh mitgenommen.",
          style: TextStyle(color: Colors.black),
        ),
      ),
      RichText(
        text: TextSpan(
          text: "Alles.",
          style: TextStyle(color: Colors.black),
        ),
      ),
    ];

    return Scaffold(
      appBar: CustomAppBar(
        back: viewModel.pop,
        home: viewModel.home,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: ListView.separated(
                itemCount: questions.length,
                itemBuilder: (BuildContext context, int index) {
                  return ExpansionTile(
                    title: Text(questions[index]),
                    textColor: kcPrimaryColor,
                    iconColor: kcPrimaryColor,
                    children: [
                      Container(padding: paddingMedium, child: answers[index]),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  InfoViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      InfoViewModel();
}
