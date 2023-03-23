import 'package:flutter/material.dart';
import 'package:sperrgut_stgallen/ui/common/app_colors.dart';
import 'package:sperrgut_stgallen/ui/common/ui_helpers.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final Function() back;
  final Function() home;

  const CustomAppBar({
    super.key,
    required this.back,
    required this.home,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 140,
      leading: (showBack)
          ? MaterialButton(
              onPressed: back,
              child: Row(
                children: [
                  const Icon(
                    Icons.arrow_back_ios,
                    color: kcPrimaryColor,
                  ),
                  Text(
                    "Zurück",
                    style: TextStyle(
                        color: kcPrimaryColor,
                        fontSize: getResponsiveMediumFontSize(context)),
                  ),
                ],
              ),
            )
          : const SizedBox(),
      backgroundColor: Colors.white,
      actions: [
        MaterialButton(
          onPressed: home,
          child: Center(
            child: Text(
              "Home",
              style: TextStyle(
                  color: kcPrimaryColor,
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
