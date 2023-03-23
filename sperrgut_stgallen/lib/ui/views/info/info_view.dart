import 'package:flutter/material.dart';
import 'package:sperrgut_stgallen/ui/common/app_colors.dart';
import 'package:sperrgut_stgallen/ui/common/custom_appbar.dart';
import 'package:stacked/stacked.dart';

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
      'Was gilt als Sperrgut?',
      'Wann wird Sperrgut abgeholt?',
      'Kann ich auch an anderen Tagen Sperrgut entsorgen?',
    ];

    final List<RichText> answers = <RichText>[
      RichText(
        text: const TextSpan(
          text:
              "Als Sperrgut gelten brennbare grosse Güter, wie z.B. Möbel, Teppiche, Ski, Matratzen, Betten, Tische, Stühle oder Koffer.",
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
      ),
      RichText(
        text: const TextSpan(
          text:
              "Das Sperrgut wird jeweils mit der wöchentlichen Kehrichtabfuhr mitgenommen.",
          style: TextStyle(color: Colors.black),
        ),
      ),
      RichText(
        text: const TextSpan(
          text:
              "Ja. Bei den Entsorgungszentren Ost und West können Sie auch zu anderen Zeiten Ihr Sperrgut entsorgen. Die Gebühren werden dort abhängig vom Gewicht berechnet.",
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
                      Container(
                          padding: EdgeInsets.fromLTRB(16, 4, 16, 16),
                          child: answers[index]),
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
