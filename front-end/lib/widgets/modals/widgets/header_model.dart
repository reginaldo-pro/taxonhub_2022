import 'package:flutter/material.dart';
import 'package:front_end/colors/colors.dart';

class HeaderModal extends StatelessWidget {
  const HeaderModal({
    Key? key,
    required this.title,
    this.icon,
    this.colorIcon = ColorsApp.warning,
  }) : super(key: key);

  final String title;
  final IconData? icon;
  final Color? colorIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            visible: icon != null,
            replacement: const SizedBox.shrink(),
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              child: Icon(
                icon,
                size: 30,
                color: colorIcon,
              ),
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 29,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
