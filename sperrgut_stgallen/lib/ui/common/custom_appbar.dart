import 'package:flutter/material.dart';
import 'package:sperrgut_stgallen/ui/common/app_colors.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final Function() back;
  final Function() home;
  final bool showBack;

  CustomAppBar({
    super.key,
    required this.back,
    required this.home,
    this.showBack = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 140,
      leading: (showBack)
          ? MaterialButton(
              onPressed: back,
              child: Row(
                children: const [
                  Icon(
                    Icons.arrow_back_ios,
                    color: kcPrimaryColor,
                  ),
                  Text(
                    "Zurück",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: kcPrimaryColor,
                    ),
                  ),
                ],
              ),
            )
          : const SizedBox(),
      backgroundColor: Colors.white,
      actions: [
        MaterialButton(
          onPressed: home,
          child: const Center(
            child: Text(
              "Home",
              style: TextStyle(
                fontSize: 16.0,
                color: kcPrimaryColor,
              ),
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
