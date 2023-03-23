import 'package:flutter/material.dart';
import 'package:sperrgut_stgallen/ui/common/ui_helpers.dart';

class ListButton extends StatelessWidget {
  final Function() onPressed;
  final IconData icon;
  final String text;
  final Widget? leading;

  const ListButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.text,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(height: 0, color: Colors.black),
        MaterialButton(
          onPressed: onPressed,
          child: Column(
            children: [
              verticalSpaceMedium,
              Row(
                children: [
                  (leading == null)
                      ? Icon(
                          icon,
                          size: mediumSize,
                        )
                      : leading!,
                  horizontalSpaceMedium,
                  Text(
                    text,
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
              verticalSpaceMedium,
            ],
          ),
        ),
        const Divider(height: 0, color: Colors.black),
      ],
    );
  }
}
